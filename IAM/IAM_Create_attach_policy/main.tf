//Create a new user and tag with Devops
resource "aws_iam_user" "create_iam_user" {
    name = "Cloud_Admin"
    tags = {
      Name: "DevOps"
    }
  
}

//Attaching the admin user to the admin group
resource "aws_iam_group_membership" "team" {
  name = "admin"
  users = [ aws_iam_user.create_iam_user.name ]
  group = "admin"

}
//Attaching Administrator access policies to the user

resource "aws_iam_group_policy_attachment" "adminaccess" {
  group= "admin"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}