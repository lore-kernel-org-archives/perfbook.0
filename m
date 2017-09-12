Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+V9/Ml0dLOoafJF7DjHNp9GeWbo5CV8tqt1YcjFooms=;
 b=ASJwgJMJXeLo6nkdNAVaJ6XsUzZqH7xlUK02H2skugBM7OZdgHT+aEqlzisNPM+jlH
 MuparSRniv9rr6GrS+VHglIS+v5ncXVRvSR6xaV+F1FMRI/9HmTrpdAE45NyBbk3izEu
 a4CHW3czoLdZjS1UDcUm/x70R9GJpJHZ54XHdbbzaIS5l+wimNGcvDn77V/PvJl5jDjm
 1teh+/5ELssxKm4kwDlZDtmfkTGWUTjJ1cxdVQwjIdgDJIEIoI918caDsqEaRm8n9YTE
 sLNxdvAa5c+LOh+y1JgK1eOnT8Ysua5c96muJZtd2d0oCjYNrlHc7AUvFW/2CJXj6kf5
 1I7Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/3] memorder: Remove unnecessary comma
Date: Tue, 12 Sep 2017 09:56:16 +0900
Message-Id: <20170912005617.19975-2-sj38.park@gmail.com>
In-Reply-To: <20170912005617.19975-1-sj38.park@gmail.com>
References: <20170912005617.19975-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 2da7b98..8511c3a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1103,7 +1103,7 @@ exists (1:r2=2 /\ 0:r2=2)

 \subsubsection{Load Followed By Store}
 Listing~\ref{lst:memorder:Load-Buffering Litmus Test (No Ordering)}
-(\path{C-LB+o-o+o-o.litmus}),
+(\path{C-LB+o-o+o-o.litmus})
 shows the classic \emph{load-buffering} litmus test.
 Although relatively strongly ordered systems such as x86
 or the IBM Mainframe do not reorder prior loads with subsequent stores,
-- 
2.10.0

