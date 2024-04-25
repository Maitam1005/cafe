using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Project_cuối_kỳ.DTO
{
     class Table
    {
        public Table(int id, string name, string status) 
        {
            this.ID = id;
            this.Name = name;
            this.Status = status;
        }

        public Table(DataRow row)
        {

        }
        private string status;
        public string Status
        {
            get { return Status; }
            set { Status = value; }
        }

        private string name;
        public string Name
        {
            get { return Name; }
            set { Name = value; }
        }

        private int iD;

        public int ID
        {
            get { return iD; }
            set { iD = value; }
        }
    }
}
