// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");
using Microsoft.EntityFrameworkCore;
using System.Linq;
using TestViewEfCore.Models;

Console.WriteLine("Hello, World!");

var lCnxStr = "Server=**************;initial catalog=*********;;User ID=**;Password=**;MultipleActiveResultSets=true;App=Geckos;Trust Server Certificate=true";

var lDbContextOptions = new DbContextOptionsBuilder<TestViewEFCoreDbContext>()
   .UseSqlServer(lCnxStr)
   .Options;
using (var lDbContext = new TestViewEFCoreDbContext(lDbContextOptions))
{
    //lDbContext.Inss.ToList();

    //var lEnfs = lDbContext.Enfants.Where(e => e.LastIns.OpDt > DateTime.Now.AddMonths(-3)).ToList();
    //var t = 4;

    List<byte> lWsOpNumList = new List<byte> { 2, 3 };
    var lTest = lDbContext.Enfants.Where(lHe => !lWsOpNumList.Except(lHe.InsIndex.Select(lHi => lHi.WsOpNum)).Any()).ToList();//fail
    var lTest2 = lDbContext.Enfants.Where(lHe => lWsOpNumList.All(i => lHe.InsIndex.Any(lHi => lHi.WsOpNum == i))).ToList();//fail
}

