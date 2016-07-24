using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BasketballManager
{
    public class GamePlayed
    {

        private string firstname;

        public string Firstname
        {
            get { return firstname; }
            set { firstname = value; }
        }
        private string lastname;

        public string Lastname
        {
            get { return lastname; }
            set { lastname = value; }
        }
        private int points;

        public int Points
        {
            get { return points; }
            set { points = value; }
        }

        public GamePlayed(string f, string l, int p)
        {
            this.firstname = f;
            this.lastname = l;
            this.points = p;
        }


    }
}