using System;
using System.Collections.Generic;

namespace SP_CRUD.Models;

public partial class TblBackup
{
    public int BookId { get; set; }

    public string Title { get; set; } = null!;

    public string Author { get; set; } = null!;
}
