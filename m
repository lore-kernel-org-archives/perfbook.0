Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33995 "EHLO
 mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751029AbdGODwK (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 14
 Jul 2017 23:52:10 -0400
Received: by mail-pf0-f196.google.com with SMTP id c24so12940019pfe.1 for
 <perfbook@vger.kernel.org>; Fri, 14 Jul 2017 20:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=z2QZ+j0mgX7oDWBfXjd0m7dvRLGu8COXUQai5xHfoOA=;
 b=TXJvvcFx8UfQCw+Of8BTZSRS1D83l9ulubkwA43xNXsmPvsBUt7l0eoCZgVTsgmHNX
 6vp/9xf9tjDM/bvrgmBQdkk0pgsHuyGJ9Hu2KPZN1y8barSl9Q2Nc8hZDw+mH07V3FVG
 pq8Df4O6doV4zietilc0RIVbZ9+1jtofYOwqMXTic6Fhim/5ac2JDjVj56exX3oyBquQ
 h9iKpz8oKgP9Q+VuzWlnkScXo8DnPjDxiVzD4yuQFmti1UW591xkNfVUSnEX6YKRC1dn
 8VhRi0NfqceuQViGfVaQCh2E5vHAPJm/uWvX9225wAdxeubZKlJwLxsiakmtUJaXF44Z
 hXhQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] Advsync: fix typos
Date: Sat, 15 Jul 2017 11:51:46 +0800
Message-Id: <1500090706-6325-1-git-send-email-junchangwang@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>

Hi Paul,

I have read through Chapter Advance Synchronization, and following are two
typos. Please take a look. Thanks for this excellent book!

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index c9c975c..009dc6e 100644
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
@@ -2511,7 +2511,7 @@ Failure to follow this rule can have serious side effects:
 	In theory, yes, you could load an integer, perhaps to use
 	it as an array index.
 	In practice, the compiler knows too much about integers,
-	and thus has way too many opportunities to break your
+	and thus has too many opportunities to break your
 	dependency chain.
 \end{enumerate}

-- 
2.7.4

