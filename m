Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40824 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbgBLOfb (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 12 Feb 2020 09:35:31 -0500
Received: by mail-pf1-f193.google.com with SMTP id q8so1336454pfh.7
        for <perfbook@vger.kernel.org>; Wed, 12 Feb 2020 06:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=t7KWJ7r44vq0xY2nPuta2vYIi+Xf34j/+h347YCDsNQ=;
        b=jz7TnU0n3c/CPBk3yWm251NwLWBXywRq2CP8Fpn+c8QhTtQuHaF9My42tl+a3nXjl1
         A7UDjbrqlvROrSd32J9q0GaVYlc+bZU8DBLafDy7rE25V6A9gZX5etY4ZEiiYHajnMaq
         yCmja3Z68WrvuC6klx4D8oD8Xa+sg30eVbB+o8ytq8iTmF/HkADri0yJ8kym5TghoEMk
         7Rf1WgztqFvsuCQb+ejw6i02SWwSBltt3zbFdTPH4/MB2+Wwyz1i+OCZOSKYT5hqdLon
         JL4z1Fbv/KhIi8d7vePGyNdzJLBOrc6Mx35zRYxerWAXx5A9gb6XWaqdG2Aq8PJKa9RS
         v4Eg==
Received: from PhD (li1566-229.members.linode.com. [139.162.86.229])
        by smtp.gmail.com with ESMTPSA id iq22sm779180pjb.9.2020.02.12.06.35.25
        for <perfbook@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Feb 2020 06:35:28 -0800 (PST)
Date: Wed, 12 Feb 2020 22:35:15 +0800
From: Junchang Wang <junchang2020@gmail.com>
Subject: [PATCH] datastruct.tex: fix some minor typos
Message-ID: <20200212143457.GA25828@PhD>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---

Hi Paul,

I'm reading the latest version of the perfbook and this patch contains fixes to
some typos in Section Data Structures. Hope it helps.

Thanks,
--Junchang

--
 datastruct/datastruct.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 4b62471..e21952b 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -700,7 +700,7 @@ Of course, it is quite possible that the differences in lookup performance
 are affected by the differences in update rates.
 One way to check this is to artificially throttle the update rates of
 per-bucket locking and hazard pointers to match that of RCU.
-Doing so does not significantly improve the lookup performace of
+Doing so does not significantly improve the lookup performance of
 per-bucket locking, nor does it close the gap between hazard pointers
 and RCU.
 However, removing the read-side memory barriers from hazard pointers
@@ -800,8 +800,8 @@ scalability, external consistency, or all of the above.
 \section{Non-Partitionable Data Structures}
 \label{sec:datastruct:Non-Partitionable Data Structures}
 %
-\epigraph{Undertake somthing difficult, otherwise you will never grow.}
-	 {\emph{Ronald E.~Osburn}}
+\epigraph{Undertake something difficult, otherwise you will never grow.}
+	 {\emph{Ronald E.~Osborn}}
 
 \begin{figure}[tb]
 \centering
@@ -1063,7 +1063,7 @@ Otherwise, a concurrent resize operation has already distributed this
 bucket, so line~\lnref{new_hashtbl} proceeds to the new hash table,
 line~\lnref{get_newbkt} selects the bucket corresponding to the key,
 and line~\lnref{acq_newbkt} acquires the bucket's lock.
-\Clnref{lsp1b}{lsp1e} store the bucket pointer and
+\Clnrefrange{lsp1b}{lsp1e} store the bucket pointer and
 pointer-set index into their respective fields in the
 \co{ht_lock_state} structure, which again communicates this information to
 \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
-- 
2.7.4

