require 'aws-sdk'
require 'pp'

polly = Aws::Polly::Client.new

pp polly.synthesize_speech(
    response_target: '/mnt/c/Users/uzuki/Music/polly_example_en.mp3',
    output_format: 'mp3',
    text: <<TEXT,
Amazon Polly converts text to lifelike speech in the cloud.
You can download the generated audio from the console,
or stream it directly to your applications and services through the API.
TEXT
    text_type: 'text',
    voice_id: 'Geraint'
)

pp polly.synthesize_speech(
    response_target: '/mnt/c/Users/uzuki/Music/polly_example_jp.mp3',
    output_format: 'mp3',
    text: <<TEXT,
Amazon テキスト読み上げ機能は、クラウド内でテキストを自然な音声に変換します。
生成された音声は、コンソールからダウンロードするか、
API を経由してアプリケーションやサービスに直接ストリーミングできます。
TEXT
    text_type: 'text',
    voice_id: 'Mizuki'
)

pp polly.describe_voices(language_code: 'ja-JP')
