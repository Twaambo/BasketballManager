using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BasketballManager
{
    public class Game
    {

        private int gameid;

        public int Gameid
        {
            get { return gameid; }
            set { gameid = value; }
        }
        private string gamename;

        public string Gamename
        {
            get { return gamename; }
            set { gamename = value; }
        }
        private string gameplace;

        public string Gameplace
        {
            get { return gameplace; }
            set { gameplace = value; }
        }
        private DateTime gamedate;

        public DateTime Gamedate
        {
            get { return gamedate; }
            set { gamedate = value; }
        }
        private int gscore;

        public int Gscore
        {
            get { return gscore; }
            set { gscore = value; }
        }
        private int teamhost;

        public int Teamhost
        {
            get { return teamhost; }
            set { teamhost = value; }
        }
        private int teamaway;

        public int Teamaway
        {
            get { return teamaway; }
            set { teamaway = value; }
        }
        private int teamid;

        public int Teamid
        {
            get { return teamid; }
            set { teamid = value; }
        }
        private int seasonid;

        public int Seasonid
        {
            get { return seasonid; }
            set { seasonid = value; }
        }

    }
}