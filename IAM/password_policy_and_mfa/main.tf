resource "aws_iam_account_password_policy" "password_policy" {
    minimum_password_length = abs(8)
    require_lowercase_characters = true
    require_numbers = true
    require_uppercase_characters = true
    require_symbols = true
    max_password_age = abs(90)
    allow_users_to_change_password = false
    password_reuse_prevention = abs(5)
    
  
}