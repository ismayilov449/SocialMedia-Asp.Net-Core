using Microsoft.EntityFrameworkCore.Migrations;

namespace SocialMedia_Asp.Net_Project_.Migrations.SocialMediaDb
{
    public partial class Init3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "UserFullName",
                table: "Posts",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UserFullName",
                table: "Comments",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "UserFullName",
                table: "Posts");

            migrationBuilder.DropColumn(
                name: "UserFullName",
                table: "Comments");
        }
    }
}
