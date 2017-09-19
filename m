Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=I9YFW0fCncxeJ95NRL9/lD7zMs4rP2EEgO7MaIY+UVo=;
 b=M4MIzGV+yfmMSpybVG9QzVoMWaY2dxkTPwxt+bkucAGOI9phPnfNxMywPRqgnwddb1
 i6BPGxmFvSTDGYPY0Pm0HVP+k2KwVDoEIeu0hM8twltIDYB6pPadOpu2QKQLR3jP1Z59
 NtSQ3CIcObgnEOP3PIV6X4rZK2WIKx12IxCahHmXBEtivLau7Zr9EHHMA7N9pc6EWJX0
 7E51/YkwRiSbj/TTq5kYnDSgGtiNlYBoKawZLK2pjp1wmFBx9l6nK7XHZdRd5KR1GVH3
 hsKBZ5rYlHCbVJbPzEhhx7jMygPBHQ63naR+u082TvUaDwiupYB/ImtH1trL3AoovdKR
 dJcA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/3] memorder: Remove unnecessary comma
Date: Wed, 20 Sep 2017 00:34:54 +0900
Message-Id: <20170919153456.10274-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index f7ec84a..820e718 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1254,7 +1254,7 @@ exists (1:r2=x0 /\ 1:r3=1)
 \end{listing}

 Listing~\ref{lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering)}
-(\path{C-MP+o-wmb-o+o-addr-o.litmus}),
+(\path{C-MP+o-wmb-o+o-addr-o.litmus})
 shows a linked variant of the message-passing pattern.
 The head pointer is \co{x1}, which initially
 references the \co{int} variable \co{y} (line~5), which is in turn
@@ -1576,7 +1576,7 @@ exists (1:r2=2 /\ 0:r2=2)
 \end{listing}

 Listing~\ref{lst:memorder:Load-Buffering Control-Dependency Litmus Test}
-(\path{C-LB+o-r+o-ctrl-o.litmus}),
+(\path{C-LB+o-r+o-ctrl-o.litmus})
 shows another load-buffering example, this time using a control
 dependency (line~19) to order the load on line~18 and the store on
 line~20.
-- 
2.10.0

