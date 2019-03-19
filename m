Return-Path: <slavomir.kaslev@gmail.com>
From: Slavomir Kaslev <kaslevs@vmware.com>
Subject: [PATCH] toolsoftrade: Fix code listing 4.22 in Chapter 4
Date: Tue, 19 Mar 2019 16:59:27 +0200
Message-Id: <20190319145927.29610-1-kaslevs@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, rostedt@goodmis.org, slavomir.kaslev@gmail.com
List-ID: <perfbook.vger.kernel.org>

Code listing 4.22 is broken since the READ_ONCE() macro takes a rvalue and the
expression parenthesis are unbalanced. This patch fixes it.

Signed-off-by: Slavomir Kaslev <kaslevs@vmware.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 41605a33..4e0764d0 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2111,7 +2111,7 @@ Listing~\ref{lst:toolsoftrade:Avoiding Danger, 2018 Style}.
 \begin{listing}[tbp]
 \begin{linelabel}[ln:toolsoftrade:Preventing Load Fusing]
 \begin{VerbatimL}[commandchars=\\\{\}]
-while (!READ_ONCE((!need_to_stop))
+while (!READ_ONCE(need_to_stop))
 	do_something_quickly();
 \end{VerbatimL}
 \end{linelabel}
-- 
2.19.1

