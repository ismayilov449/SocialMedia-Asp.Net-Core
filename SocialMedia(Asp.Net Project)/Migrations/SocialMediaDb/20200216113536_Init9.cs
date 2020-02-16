using Microsoft.EntityFrameworkCore.Migrations;

namespace SocialMedia_Asp.Net_Project_.Migrations.SocialMediaDb
{
    public partial class Init9 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "Friends",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Status",
                table: "Friends");
        }
    }
}
