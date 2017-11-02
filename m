Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:52872 "EHLO
 mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750883AbdKBG6E (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 2
 Nov 2017 02:58:04 -0400
Received: by mail-pg0-f68.google.com with SMTP id a192so4264107pge.9 for
 <perfbook@vger.kernel.org>; Wed, 01 Nov 2017 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NS2wH5PBUO+2hcwucB2BXFaruad0qKEBO/57mu44c9o=;
 b=YsWRbFRAnU1c6gyEo9WaoGVClMWDUdXaB/Y82AjxOTZaX3/KXHSBJS0pvG2yHtHOh0
 sZkLqE7QAJJMEdIciJH4MWlMWdWTckeUkmuWxrjx9olfnItmGn/u2v2GOTUYzYux3paK
 2vE9JAfmNNnN3aOlYy1OhTd5bhTuW6ein7yDQhVobl6hOuP0X+mrDs0cVVLIT5VdVueH
 rjkpuCycXTgXuY68zSq6piRJORMJ9RLg01b1zdSWrGAHfF10LuDq6p3NDjTIaDhaDEgq
 nKTHr5HNZnSDbcVD+1hZEOTEUlOBY+LgP8CtVzxuZSYe8l5BaARNxN18WHU55PMK6XpI
 s7eg==
From: pierre Kuo <vichy.kuo@gmail.com>
Subject: [PATCH 2/2] SMPdesign: fix typo
Date: Thu,  2 Nov 2017 14:57:49 +0800
Message-Id: <1509605869-8186-2-git-send-email-vichy.kuo@gmail.com>
In-Reply-To: <1509605869-8186-1-git-send-email-vichy.kuo@gmail.com>
References: <1509605869-8186-1-git-send-email-vichy.kuo@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Pierre Kuo <vichy.kuo@gmail.com>

From: Pierre Kuo <vichy.kuo@gmail.com>

In 6.5.1 Work-Queue Parallel Maze Solver, the line #4 and line #5 of
listing 6.13 seem describe the cell 't' instead of cell 'n'.

Signed-off-by: Pierre Kuo <vichy.kuo@gmail.com>
---
 SMPdesign/beyond.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 72862c5..88e2b31 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -141,8 +141,8 @@ Line~20 initializes for the next pass through the outer loop.
 The pseudocode for \co{maze_try_visit_cell()} is shown on lines~1-12
 of Listing~\ref{lst:SMPdesign:SEQ Helper Pseudocode}
 (\path{maze.c}).
-Line~4 checks to see if cells \co{c} and \co{n} are adjacent and connected,
-while line~5 checks to see if cell \co{n} has not yet been visited.
+Line~4 checks to see if cells \co{c} and \co{t} are adjacent and connected,
+while line~5 checks to see if cell \co{t} has not yet been visited.
 The \co{celladdr()} function returns the address of the specified cell.
 If either check fails, line~6 returns failure.
 Line~7 indicates the next cell, line~8 records this cell in the next
-- 
1.9.1

