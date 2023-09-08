# 概要
OCR技術を使って写真から文字起こしをする。

# 実行環境：Docker
workディテクトリを作成
docker run -v ~/1{workまでのpath}/work:/work -p 8888:8888 datascientist/ds-python-env4
cd work
git pull {本リポジトリ}

# 補足
言語ファイルのパスはDokcer上では"/opt/anaconda3/share/tessdata"になっている

