Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=l+PJSwCJk87/IYR5rhx5FDA6tKL2yFuLxej933XeECM=;
 b=QVKUpPBAzICUFl4DwHvpqhMHOdXdWa9/kaPJRnbR+bo5gP8xOTGZpkjxhegG6eTq9h
 BZlfKKukkwlVUmS+mchLtA/fizo4y/oktbo5OBtkPU0mwcG8ITQ+njvp1qBtx1Ew52zO
 DPRqnBvYHhfwothmKvI1T4ekAT10FO7DNFnBYUN0V7oHCgGIkrBZzq5XQN5Yc8Go7F8V
 8WErxjzxAevFuSIi5hsLv62vUcDjrSlVDLws8jK8IXIyec0S23wkIFPKZeb4/67osw6n
 +5YGDaZBg3XdGZg2ZOxrF0XPpPPg60NAUYWdi0NnNf2rSrmC0QFdp2lBOog4ksLSBzMq
 gtIA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] advsync: Rephrase a question sentence
Date: Sat, 15 Jul 2017 15:24:57 +0800
Message-Id: <1500103497-4303-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com, akiyks@gmail.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Slightly rephrase a question sentence.

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
Suggested-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index c9c975c..b97e218 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -950,7 +950,7 @@ thereby forcing the required ordering on all platforms.
 \label{fig:advsync:S Address-Dependency Litmus Test}
 \end{figure}

-But suppose that the dependent operation is a write rather than
+But what happens if the dependent operation is a write rather than
 a read, for example, in the \emph{S}
 litmus test~\cite{JadeAlglave2011ppcmem} shown in
 Figure~\ref{fig:advsync:S Address-Dependency Litmus Test}?
-- 
2.7.4

