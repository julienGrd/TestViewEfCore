﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace TestViewEfCore.Models;

public partial class Inss
{
    public int Index { get; set; }

    public string Matricule { get; set; }

    public DateTime OpDt { get; set; }

    public DateTime? FinDate { get; set; }

    public string Oid { get; set; }

    public string UsNom { get; set; }

    public string UsPrenoms { get; set; }

    public string TsNaisNom { get; set; }

    public string TsNaisPrenoms { get; set; }

    public string TsNaisDate { get; set; }

    public int? VilleId { get; set; }

    public string TsSexe { get; set; }

    public string WsRetour { get; set; }

    public string ExceptionDetail { get; set; }

    public string TsNaisPremPrenom { get; set; }

    public byte OrigNum { get; set; }

    public byte WsOpNum { get; set; }

    public byte? IdentJustifNum { get; set; }

    public bool IdentIsValidated { get; set; }

    public short? IntervNum { get; set; }

    public virtual ICollection<Enfants> NumDos { get; } = new List<Enfants>();
}