Basketball Manager Code;
SQL queries:
Getting all players:
SELECT PLAYER.PLAYERID, PLAYER.PFIRSTNAME, PLAYER.PLASTNAME, PLAYER.PDOB, PLAYER.PWHEIGHT, PLAYER.PHAIGHT, TEAM.TNAME FROM PLAYER, TEAM WHERE PLAYER.PLAYERID = TEAM.TEAMID

Insert Player:

INSERT INTO "PLAYER" ("PLAYERID", "PFIRSTNAME", "PLASTNAME", "PDOB", "PWHEIGHT", "PHAIGHT", "TEAMID") VALUES (:PLAYERID, :PFIRSTNAME, :PLASTNAME, :PDOB, :PWHEIGHT, :PHAIGHT, :TEAMID)

Update Players:

UPDATE "PLAYER" SET "PFIRSTNAME" = :PFIRSTNAME, "PLASTNAME" = :PLASTNAME, "PDOB" = :PDOB, "PWHEIGHT" = :PWHEIGHT, "PHAIGHT" = :PHAIGHT, "TEAMID" = :TEAMID WHERE "PLAYERID" = :original_PLAYERID AND (("PFIRSTNAME" = :original_PFIRSTNAME) OR ("PFIRSTNAME" IS NULL AND :original_PFIRSTNAME IS NULL)) AND (("PLASTNAME" = :original_PLASTNAME) OR ("PLASTNAME" IS NULL AND :original_PLASTNAME IS NULL)) AND (("PDOB" = :original_PDOB) OR ("PDOB" IS NULL AND :original_PDOB IS NULL)) AND (("PWHEIGHT" = :original_PWHEIGHT) OR ("PWHEIGHT" IS NULL AND :original_PWHEIGHT IS NULL)) AND (("PHAIGHT" = :original_PHAIGHT) OR ("PHAIGHT" IS NULL AND :original_PHAIGHT IS NULL)) AND (("TEAMID" = :original_TEAMID) OR ("TEAMID" IS NULL AND :original_TEAMID IS NULL))

Delete: Player:

DELETE FROM "PLAYER" WHERE "PLAYERID" = :original_PLAYERID AND (("PFIRSTNAME" = :original_PFIRSTNAME) OR ("PFIRSTNAME" IS NULL AND :original_PFIRSTNAME IS NULL)) AND (("PLASTNAME" = :original_PLASTNAME) OR ("PLASTNAME" IS NULL AND :original_PLASTNAME IS NULL)) AND (("PDOB" = :original_PDOB) OR ("PDOB" IS NULL AND :original_PDOB IS NULL)) AND (("PWHEIGHT" = :original_PWHEIGHT) OR ("PWHEIGHT" IS NULL AND :original_PWHEIGHT IS NULL)) AND (("PHAIGHT" = :original_PHAIGHT) OR ("PHAIGHT" IS NULL AND :original_PHAIGHT IS NULL)) AND (("TEAMID" = :original_TEAMID) OR ("TEAMID" IS NULL AND :original_TEAMID IS NULL))

Get Statistics:

SELECT PLAYER.PFIRSTNAME, PLAYER.PLASTNAME, PERFORMANCE.TOTALP FROM GAME, PERFORMANCE, PLAYER WHERE GAME.GAMEID = PERFORMANCE.GAMEID AND PERFORMANCE.PLAYERID = PLAYER.PLAYERID AND (GAME.GAMEDATE BETWEEN to_date(:STARTDATE) AND to_date(:ENDDATE)) ORDER BY PERFORMANCE.TOTALP DESC





C# Code:
Default Page:
using System;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketballManager
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Players_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                Players.Insert();
                Players.DataBind();
                GridView1.DataSource = Players;
                GridView1.DataBind();
                Response.Write("<script>alert('New player inserted!');</script>");
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error Occured please insert player again');</script>");
                throw;
            }
           
        }
    }
}





Statistics Page:
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasketballManager
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataSourceSelectArguments args = new DataSourceSelectArguments();
            DataView view = (DataView)Statistics.Select(args);
            DataTable dt = view.ToTable();
            List<GamePlayed> gpl = new List<GamePlayed>();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                GamePlayed g = new GamePlayed(dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString(), int.Parse(dt.Rows[i][2].ToString()));
                gpl.Add(g);
            }
            gpl.ForEach(z => z.Points =
            gpl.Where(x => x.Firstname == z.Firstname).Sum(y => y.Points) + 0);
            List<GamePlayed> distinctItems = gpl.GroupBy(x => x.Firstname).Select(y => y.First()).ToList();
            distinctItems.Sort((s2, s1) => s1.Points.CompareTo(s2.Points));

            DataTable dtx = new DataTable();
            dtx.Columns.Add("First Name", typeof(string));
            dtx.Columns.Add("Last Name", typeof(string));
            dtx.Columns.Add("Points total", typeof(int));

            if (distinctItems != null)
            {
                foreach (GamePlayed g in distinctItems)
                {
                    DataRow row1 = dtx.NewRow();
                    row1["First Name"] = g.Firstname;
                    row1["Last Name"] = g.Lastname;
                    row1["Points total"] = g.Points;
                    dtx.Rows.Add(row1);
                }
            }
            GridView1.DataSource = dtx;
            GridView1.DataBind();
        } 
    }
}
