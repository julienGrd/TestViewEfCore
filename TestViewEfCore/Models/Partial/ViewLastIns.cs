using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestViewEfCore.Models;

public partial class ViewLastIns
{
    //added by me for the relation
    public Enfants Enf { get; set; }
}
