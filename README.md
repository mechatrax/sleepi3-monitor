sleepi3-monitor
====================

slee-Pi 3 でシステムの監視を行うためのツール類を提供します。

## 提供ファイル  
次のファイルとディレクトリがパッケージに含まれています。

### /usr/sbin/sleepi3mon  
slee-Pi 3 のパワーマネジメントモジュールを監視するための実行ファイルです。  
設定可能な項目を次に示します。

* -c \<FILE\>  
  \<FILE\> から設定を読み込みます。  
  デフォルト /etc/sleepi3/monitor.yml 以外の設定ファイルを読み込む際に使用します。

* -D
  デーモンとして動作します。

### /etc/sleepi3-monitor/monitor.yml  
slee-Pi 3 の監視動作の設定を行うための YAML ファイルです。  
設定可能な項目は各セクションに分かれています。

* common  
  共通設定のセクションです。  
  - interval  
    監視動作のインターバルです。  
    単位は [秒] です。  
    デフォルトは 1 です。  
* extin  
  外部信号入力コネクタ（CN4）の監視動作を設定するセクションです。  
  - history_size  
    履歴に保持する値の数です。  
  - commands  
    実行するコマンドの設定の配列です。  
    配列の各要素には次の要素を持たせることができます。  
    + exec  
      条件を満たした場合に実行されるコマンドです。  
      ディレクトリを指定した場合は存在するファイルを実行します。
    + condition  
      コマンドの実行条件を設定します。  
      over, under, any, none のいずれかを指定します。  
      閾値を上回った場合にコマンドを実行するには over を指定します。  
      閾値を下回った場合にコマンドを実行するには under を指定します。  
      常にコマンドを実行するには any を指定します。  
      コマンドを無効にするには none を指定します。  
    + threshold  
      コマンドの実行条件の閾値です。  
      単位は [秒] です。  
      最大値は 255 です。  
    + oneshot  
      command の実行方法を設定します。  
      true または false を指定します。  
      実行条件が満たされた場合に command を一度だけ実行するには true を指定します。    
      実行条件が満たされている場合に command を繰り返し実行するには false を指定します。  
* pushsw  
  SW1 の監視動作を設定するセクションです。  
  - history_size  
    履歴に保持する値の数です。  
  - commands  
    実行するコマンドの設定の配列です。  
    配列の各要素には次の要素を持たせることができます。  
    + exec  
      条件を満たした場合に実行されるコマンドです。  
      ディレクトリを指定した場合は存在するファイルを実行します。
    + condition  
      コマンドの実行条件を設定します。  
      over, under, any, none のいずれかを指定します。  
      閾値を上回った場合にコマンドを実行するには over を指定します。  
      閾値を下回った場合にコマンドを実行するには under を指定します。  
      常にコマンドを実行するには any を指定します。  
      コマンドを無効にするには none を指定します。  
    + threshold  
      コマンドの実行条件の閾値です。  
      単位は [秒] です。  
      最大値は 255 です。  
    + oneshot  
      command の実行方法を設定します。  
      true または false を指定します。  
      実行条件が満たされた場合に command を一度だけ実行するには true を指定します。    
      実行条件が満たされている場合に command を繰り返し実行するには false を指定します。  
* voltage, voltage1, voltage2  
  電源電圧の監視動作を設定するセクションです。  
  voltage : 現在の入力電圧の値を監視します。  
  voltage1 : CN1 の入力電圧の値を監視します。  
  voltage2 : CN2 の入力電圧の値を監視します。  
  - history_size  
    履歴に保持する値の数です。  
  - commands  
    実行するコマンドの設定の配列です。  
    配列の各要素には次の要素を持たせることができます。  
    + exec  
      条件を満たした場合に実行されるコマンドです。  
      ファイルを指定した場合には実行可能なファイルを実行します。  
      ディレクトリを指定した場合は指定したディレクトリに存在する実行可能なファイルを実行します。
    + condition  
      コマンドの実行条件を設定します。  
      over, under, any, none のいずれかを指定します。  
      閾値を上回った場合にコマンドを実行するには over を指定します。  
      閾値を下回った場合にコマンドを実行するには under を指定します。  
      常にコマンドを実行するには any を指定します。  
      コマンドを無効にするには none を指定します。  
    + threshold  
      コマンドの実行条件の閾値です。  
      単位は [mV] です。  
      最大値は 65535 です。  
    + oneshot  
      command の実行方法を設定します。  
      true または false を指定します。  
      実行条件が満たされた場合に command を一度だけ実行するには true を指定します。    
      実行条件が満たされている場合に command を繰り返し実行するには false を指定します。

### /etc/sleepi3-monitor/extin.d/
extin セクションの実行コマンドのデフォルトディレクトリです。

### /etc/sleepi3-monitor/switch.d/
switch セクションの実行コマンドのデフォルトディレクトリです。

### /etc/sleepi3-monitor/voltage.d/
voltage セクションの実行コマンドのデフォルトディレクトリです。

### /etc/sleepi3-monitor/voltage-1.d/
voltage1 セクションの実行コマンドのデフォルトディレクトリです。

### /etc/sleepi3-monitor/voltage-2.d/
voltage2 セクションの実行コマンドのデフォルトディレクトリです。

### /lib/systemd/system/sleepi3-monitor.service  
slee-Pi 3 の監視サービスを実行するためのファイルです。  
sleepi3mon をデーモンとして動作させます。

### /usr/lib/sleepi3-monitor/parse_env.sh  
sleepi3mon がコマンドに渡す環境変数を bash の配列に変換するスクリプトファイルです。

### /usr/share/doc/sleepi3-monitor/changelog.Debian.gz  
パッケージの変更履歴を記録したファイルです。

### /usr/share/doc/sleepi3-monitor/copyright  
著作権とライセンスを記載したファイルです。

### /usr/share/doc/sleepi3-monitor/examples/
実行コマンドのサンプルとなるスクリプトファイルが含まれているディレクトリです。
