// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");
using Microsoft.EntityFrameworkCore;
using TestViewEfCore.Models;

Console.WriteLine("Hello, World!");

var lCnxStr = "Server=******;initial catalog=***;;User ID=**;Password=**;MultipleActiveResultSets=true;App=Geckos;Trust Server Certificate=true";

var lDbContextOptions = new DbContextOptionsBuilder<TestViewEFCoreDbContext>()
   .UseSqlServer(lCnxStr)
   .Options;
using (var lDbContext = new TestViewEFCoreDbContext(lDbContextOptions))
{
    //lDbContext.Inss.ToList();

    var lEnfs = lDbContext.Enfants.Where(e => e.LastIns.OpDt > DateTime.Now.AddMonths(-3)).ToList();
    var t = 4;
}

