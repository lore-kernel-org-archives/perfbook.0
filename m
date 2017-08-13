Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fiedMljnQ1oVhtddreOWXsczm5n7dhTGKKd0P0UR1tU=;
 b=TJw1dD5OVniepPak/KeRdvZVZu25Y//4O/BVciOD9H6ZZ8MMpIYEkPhaIyKzPVXGKe
 wIANZuoZyc3++rSGliuf44buKftsrY9GqqbV4c9I+snI9wTb/Sq41BVlWLUxP+xJk2tm
 sTcGbzkHowGgxCObGZUa6TyjHbjQvkmNQ6HRnGO1UEuvf5N40IY1L6He4klOgpTxkwN/
 Snx1A2aQQivPepAwQgY0ke/6S8dtZx0GtX2Y2kJQY1U3BHg0NYy4sGBncL0+HKTVB3iG
 AYMhMnAkYRggD7BEY+OSxZBZWvTF+V82/gCJk0TELGiM99affIVQ4nA/8O3INBXj7TVZ
 jRmA==
Subject: [PATCH 2/5] styleguide: Tweak layout of 'Limitation' table
References: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <09bee31f-dc0b-c948-5f28-63771b548c60@gmail.com>
Date: Sun, 13 Aug 2017 12:30:21 +0900
MIME-Version: 1.0
In-Reply-To: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9ecafff80ede69a2d85d5a28562fa86a5d925609 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 9 Aug 2017 19:49:18 +0900
Subject: [PATCH 2/5] styleguide: Tweak layout of 'Limitation' table

Use nice ruled lines of "booktabs".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 6b41897..2312316 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -391,12 +391,13 @@ Table~\ref{tab:app:styleguide:Limitation of Monospace Macro}
 lists such limitations.

 \begin{table}[tbh]
-\centering\footnotesize
-\begin{tabular}{lll}
+\renewcommand*{\arraystretch}{1.2}\centering\footnotesize
+\begin{tabular}{@{}lll@{}}\toprule
   Macro &  Need Escape & Should Avoid \\
-  \hline
+  \midrule
   \co{\\co}, \co{\\nbco} & \co{\\}, \%, \{, \} & \\
   \co{\\tco}  & \# & \%, \{, \}, \co{\\} \\
+  \bottomrule
 \end{tabular}
 \caption{Limitation of Monospace Macro}
 \label{tab:app:styleguide:Limitation of Monospace Macro}
-- 
2.7.4


