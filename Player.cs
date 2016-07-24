using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BasketballManager
{
    public class Player
    {

        private int playerid;

        public int Playerid
        {
            get { return playerid; }
            set { playerid = value; }
        }
        private string pfirstname;

        public string Pfirstname
        {
            get { return pfirstname; }
            set { pfirstname = value; }
        }
        private string plastname;

        public string Plastname
        {
            get { return plastname; }
            set { plastname = value; }
        }
        private DateTime pdob;

        public DateTime Pdob
        {
            get { return pdob; }
            set { pdob = value; }
        }
        private int pweight;

        public int Pweight
        {
            get { return pweight; }
            set { pweight = value; }
        }
        private int phaight;

        public int Phaight
        {
            get { return phaight; }
            set { phaight = value; }
        }
        private int teamid;

        public int Teamid
        {
            get { return teamid; }
            set { teamid = value; }
        }

 public Player(int pid, string fn, string ln, DateTime dob, int wei, int hai, int tid)
 {
     this.playerid = pid;
     this.pfirstname = fn;
     this.plastname = ln;
     this.pdob = dob;
     this.pweight = wei;
     this.phaight = hai;
     this.teamid = tid;
 }

    }
}