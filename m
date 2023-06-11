Return-Path: <SRS0=HWqj=B7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686496890; x=1689088890;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMkd7iDhND3jdkSyKZGT6+23pVpGm5fnfgjZtGNbEU0=;
        b=sgYdZaTho2hNUBeJxBOZTJfm21eGUjC712TPuV5MbjkWRIKsXrfd2RwZQtmJm/NqEK
         ueoYN6zyJjSaZ6uxQqzVDdqvPRFQgY+iUoh4T8rOEjkPuV0dVkCqo0yjDRi8Acd6E8Yo
         Bt4A9OKEDGv/KMrVaCgvudOLr9BOekX1cxb94i3XfhX+n/tGwe3rVulzNhBsQX/j2Acc
         jPSFKKp7oidiOF2Rm1p2/LAhoK+L6b43qPPLfSJPke6NNCoJ7SYZcN62CGk6kZlM5mAM
         yvUkvnnoI9HcAF1xjQ8K6GDk/eeULqabSMlqzDl11aXqAb9S1/c3WkcAlwNtfo1jvjOP
         +uQg==
Message-ID: <40ba8e60-0d3c-163d-e82c-801700aca13a@gmail.com>
Date: Mon, 12 Jun 2023 00:21:26 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer/rcuapi: Tweak Table E.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Table E.3 is not intuitive enough to be understood on its own.
Make it self explanatory by adding references to Listing E.3 and
line counts.

Reorder header rows and use \cmidrule for better representation
of table structure as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I'm not sure if this is actually an improvement, but looking at
the line labels you put in the code snippet, I'm guessing this might
be along the line of what you had in mind.

What do you think?

        Thanks, Akira
--
 defer/rcuapi.tex | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 3f5877f3264f..eea7259776d1 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -367,18 +367,23 @@ The \apik{rcu_barrier()} primitive does this job.
 \renewcommand*{\arraystretch}{1.2}
 \centering
 \small
+\begin{fcvref}[ln:defer:synchonize-rcu vs rcu-barrier]
 \begin{tabular}{lll}
 \toprule
-            & \tco{synchronize_rcu()} & \tco{rcu_barrier()} \\
-Invoked at: & \multicolumn{2}{c}{Must Wait Until:} \\
-\midrule
+            & \multicolumn{2}{c}{Must Wait Until (in \cref{lst:defer:synchronize-rcu vs. rcu-barrier}):} \\
+\cmidrule{2-3}
+\multicolumn{1}{c}{Invoked at:} & \multicolumn{1}{c}{\tco{synchronize_rcu()}}
+					& \multicolumn{1}{c}{\tco{rcu_barrier()}} \\
+\cmidrule(r){1-1} \cmidrule{2-3}
 \tco{do_something_1()} & 			 & \\
-\tco{do_something_2()} & \tco{rcu_read_unlock()} & \\
-\tco{do_something_3()} & \tco{rcu_read_unlock()} & \tco{f(&p->rh)} \\
-\tco{do_something_4()} &			 & \tco{f(&p->rh)} \\
+\tco{do_something_2()} & \tco{rcu_read_unlock()} (\clnref{rrul}) & \\
+\tco{do_something_3()} & \tco{rcu_read_unlock()} (\clnref{rrul})
+						 & \tco{f(&p->rh)} (\clnref{cb}) \\
+\tco{do_something_4()} &			 & \tco{f(&p->rh)} (\clnref{cb}) \\
 \tco{do_something_5()} & 			 & \\
 \bottomrule
 \end{tabular}
+\end{fcvref}
 \caption{\tco{synchronize_rcu()} vs. \tco{rcu_barrier()}}
 \label{tab:defer:synchonize-rcu vs rcu-barrier}
 \end{table*}
-- 
2.25.1

