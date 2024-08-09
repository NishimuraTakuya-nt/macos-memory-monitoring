# macOS メモリモニタリング

このプロジェクトは、Docker コンテナを使用して macOS 上にメモリモニタリングシステムを構築します。InfluxDB、Telegraf、Grafana を組み合わせて、システムメトリクスを収集、保存、可視化します。

## 前提条件

- macOS
- [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop)
- [Homebrew](https://brew.sh/)
- [direnv](https://direnv.net/)

## セットアップ

1. リポジトリをクローンします：

   ```bash
   git clone https://github.com/yourusername/macos-memory-monitoring.git
   cd macos-memory-monitoring
   ```

2. direnv をインストールし、シェルに設定を追加します：

   ```bash
   brew install direnv
   echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc  # または .bashrc for bash users
   ```

3. 環境変数を設定します：

   ```bash
   cp .envrc.example .envrc
   ```

   `.envrc` ファイルを編集し、適切な値を設定します。

4. direnv の設定を許可します：

   ```bash
   direnv allow
   ```

5. Docker コンテナを起動します：

   ```bash
   make up
   ```

## 使用方法

- Grafana ダッシュボード: http://localhost:3000 (デフォルトのユーザー名とパスワードは .envrc ファイルで設定)
- InfluxDB 管理画面: http://localhost:8086 (クレデンシャルは .envrc ファイルで設定)

## 主要なコマンド

Makefile に定義されたコマンドを使用して、システムを管理できます：

- `make up`: コンテナを起動
- `make down`: コンテナを停止
- `make logs`: コンテナのログを表示
- `make remove-volume`: Docker ボリュームを削除
- `make reset`: システムを完全にリセット（データも削除されます）

## カスタマイズ

- `telegraf.conf`: Telegraf の設定をカスタマイズ
- `docker-compose.yml`: コンテナの設定を変更
- Grafana ダッシュボード: Web インターフェースを通じてダッシュボードをカスタマイズ

## トラブルシューティング

問題が発生した場合は、以下を試してください：

1. `make logs` でコンテナのログを確認
2. `make reset` でシステムを完全にリセット
3. 環境変数が正しく設定されているか確認 (`echo $INFLUXDB_USERNAME` など)

## 注意事項

- このセットアップは開発環境用です。本番環境で使用する場合は、セキュリティ設定を見直してください。
- `.envrc` ファイルには機密情報が含まれるため、絶対にバージョン管理システムにコミットしないでください。

## ライセンス

このプロジェクトは [MIT ライセンス](LICENSE) の下で公開されています。

## 貢献

問題の報告や改善の提案は、GitHub の Issue または Pull Request を通じて行ってください。