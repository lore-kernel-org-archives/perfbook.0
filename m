Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YmXtmRCpxgzKyh4tc4iV6F2+n9hrf88ghsIhKA+WWz4=;
 b=aruUg0UzFm1tLM/Kv1ygv1wlK68Ptyb7OUgzFrI+Eghv7fcQvCRkzDcMoWr9XoAAVj
 yfxZASxoSySsma2vD41KF205XOIITA6xjAX4JNRveDqtQxtK222G+KpqrWX0NOUWOn7X
 At9BkJtZZ7cb8D75cEx/rTkq95t1OZR/To7rFlU4gmOqtinVjvOmmoZRHxkbY+UumhGS
 RX47AIxnc1vfcDRPyHS2DJeEoh5VN52iuwFxeGJOLGREpgNGNBwTAWuxOyn5NdM6q6HO
 Is+Hxs/0ZMHyhdokkK8HfUT0dt+TqNas9G4ZngNFbiJ4JYnxtIj7RiHTCpbHo1uUUQJD
 /d7w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] SMPdesign: keep consistent expression
Date: Wed, 27 Apr 2016 08:33:15 +0900
Message-Id: <1461713595-29898-3-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1461713595-29898-1-git-send-email-sj38.park@gmail.com>
References: <1461713595-29898-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There are few inconsistent expressions for code / type mentioning and
reference to figure / source file.  This commit polishes the expressions
to be more consistent with other expressions.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 SMPdesign/SMPdesign.tex | 4 ++--
 SMPdesign/beyond.tex    | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index d2b092d..f609e7e 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -991,11 +991,11 @@ Figure~\ref{fig:SMPdesign:Allocator-Cache Data Structures}.
 The ``Global Pool'' of Figure~\ref{fig:SMPdesign:Allocator Cache Schematic}
 is implemented by \co{globalmem} of type \co{struct globalmempool},
 and the two CPU pools by the per-CPU variable \co{percpumem} of
-type \co{percpumempool}.
+type \co{struct percpumempool}.
 Both of these data structures have arrays of pointers to blocks
 in their \co{pool} fields, which are filled from index zero upwards.
 Thus, if \co{globalmem.pool[3]} is \co{NULL}, then the remainder of
-the array from index 4 up must also be NULL.
+the array from index 4 up must also be \co{NULL}.
 The \co{cur} fields contain the index of the highest-numbered full
 element of the \co{pool} array, or -1 if all elements are empty.
 All elements from \co{globalmem.pool[0]} through
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index f4035cd..e52980b 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -135,7 +135,8 @@ Line~20 initializes for the next pass through the outer loop.
 \end{figure}

 The pseudocode for \co{maze_try_visit_cell()} is shown on lines~1-12
-of Figure~\ref{fig:SMPdesign:SEQ Helper Pseudocode}.
+of Figure~\ref{fig:SMPdesign:SEQ Helper Pseudocode}
+(\co{maze.c}).
 Line~4 checks to see if cells \co{c} and \co{n} are adjacent and connected,
 while line~5 checks to see if cell \co{n} has not yet been visited.
 The \co{celladdr()} function returns the address of the specified cell.
@@ -146,7 +147,8 @@ is now full, and line~10 marks this cell as visited and also records
 the distance from the maze start.  Line~11 then returns success.

 The pseudocode for \co{maze_find_any_next_cell()} is shown on lines~14-28
-of the figure (\co{maze.c}).
+of Figure~\ref{fig:SMPdesign:SEQ Helper Pseudocode}
+(\co{maze.c}).
 Line~17 picks up the current cell's distance plus 1,
 while lines~19, 21, 23, and~25
 check the cell in each direction, and lines~20, 22, 24, and~26
-- 
1.9.1

