# Database
Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/iwarn.sqlite3')

# Amazon S3
S3_KEY = "AKIAJKTZC2AHYR6PIISA"
S3_SECRET = "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"
S3_BUCKET = "iwarn-photos"
