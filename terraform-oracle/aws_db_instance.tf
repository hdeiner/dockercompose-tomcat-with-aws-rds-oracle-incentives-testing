resource "aws_db_instance" "oracle" {
  allocated_storage    = 10
  engine               = "oracle-ee"
  engine_version       = "11.2.0.4.v20"
  instance_class       = "db.t3.medium"
  identifier           = "dockercompose-tomcat-with-aws-rds-oracle-incentives-testing"
  name                 = "SAMPLEDB"
  username             = "oracleuser"
  password             = "password"
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = ["${aws_security_group.oracle.id}"]
}