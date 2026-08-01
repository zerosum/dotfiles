# dotfiles

複数マシンを管理する Nix flake の base リポジトリ。共通の home-manager モジュール
群と、ホスト (`mbp14`, `nuc11`) の結線を持つ。

別のリポジトリからこの flake を input `dotfiles` として参照し、下記の flake
outputs を使って自分のホストを組み立てることもできる (以下 consumer と呼ぶ)。

## flake outputs

このリポジトリが公開する outputs:

- `homeModules.default` — 共通の home-manager モジュール群 (`./modules`)
- `darwinModules.default` — nix-darwin システムモジュール (`./system/darwin`)
- `nixosModules.default` — NixOS システムモジュール (`./system/nixos`)
- `lib.mkDarwinHost` — nix-darwin ホストを組み立てるヘルパー
- `lib.mkNixosHost` — NixOS ホストを組み立てるヘルパー
- `lib.mkLocalOverlay` — ホスト固有パッケージディレクトリをオーバーレイ化するヘルパー

## consumer が満たすべき契約

### 必須の input 名

`mkDarwinHost` / `mkNixosHost` は呼び出し元の `inputs` を受け取り、その中から
**`nixpkgs`**・**`darwin`**・**`home-manager`** という名前を直接参照する
(`inputs.darwin.lib.darwinSystem`、`inputs.home-manager.darwinModules.home-manager`
など)。そのため consumer 側の flake は、これらの名前で input を宣言し、
`inherit inputs;` の形でヘルパーに渡す必要がある。

```nix
inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
  darwin = {
    url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  home-manager = {
    url = "github:nix-community/home-manager/release-25.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  dotfiles.url = "github:zerosum/dotfiles";
};
```

注意点として、base のモジュール (`homeModules.default` など) は **base 自身の
`flake.lock` のピンではなく、consumer 側のピンで評価される**。`nixpkgs` /
`darwin` / `home-manager` は consumer が指定したバージョンが使われるため、
consumer 側で `nixpkgs.follows` を揃えておくこと。

### `my.identity` は必須オプション

`modules/identity` が定義する `my.identity = { name, email }` にはデフォルト値
が無い。これは意図的な設計で、**人格を設定し忘れたまま `switch` が通ってしまう
事故を評価時に止める**ため。`name` か `email` のどちらかが欠けているとビルドが
失敗する。consumer 側のホスト設定 (`hosts/<host>/default.nix` 等) で必ず設定
すること。

```nix
my.identity = {
  name = "Your Name";
  email = "you@example.com";
};
```

### `my.git.extraIdentities` でパス単位の上書き

特定のディレクトリ配下だけ別のメールアドレス (氏名) を使いたい場合、
`modules/git` が公開する `my.git.extraIdentities` に条件を追加する。

```nix
my.git.extraIdentities = [
  {
    gitdir = "~/gitrepos/github.com/example-org/";
    email = "you@example-org.com";
    # name は省略可。省略時は my.identity.name を使う
  }
];
```

内部的には `includeIf (gitdir: ...)` として `~/.config/git/config` に書き出さ
れる。

## 使用例

consumer 側の `flake.nix` で `dotfiles.lib.mkDarwinHost` を呼び出してホストを
組み立てる。ホスト固有パッケージは `mkLocalOverlay` でオーバーレイ化して渡す。

```nix
outputs = { dotfiles, ... }@inputs: {
  darwinConfigurations.myhost = dotfiles.lib.mkDarwinHost {
    inherit inputs;
    system = "aarch64-darwin";
    hostPath = ./hosts/myhost;
    overlays = [ (dotfiles.lib.mkLocalOverlay ./pkgs) ];
  };
};
```

## コマンド

```sh
make upgrade-darwin HOST_NAME=<host>   # build してから sudo darwin-rebuild switch
make upgrade-nixos HOST_NAME=nuc11     # sudo nixos-rebuild switch
make check                             # nix eval (mkLocalOverlay のテスト) + nix flake check
make update                            # nix flake update (flake.lock を更新)
```
