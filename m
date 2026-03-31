Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F42C3DB63F
	for <perfbook@vger.kernel.org>; Tue, 31 Mar 2026 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943880; cv=none; b=bF+zdptfaIHuv2CbBVbrznYC7zopEziQAMbe/SbpUfhILncgHv4dMT60iNH71zUpmEGu836nwDn63tRzuxRqByjd/AwiW4i2lxE1nxYsw8Ph1tFAMsRt78DoUszXkvt9DBOEoO909W6mbc2BKQAJAq88VRlOHowG+Lh62NvO8XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943880; c=relaxed/simple;
	bh=4vkeuTLMWuJMhiid7PC7xignCRwf4LBwg7Q9IHUEkKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jAvHAkNRH9zClsn19u2T7swy31lq1O5m0lAbgpbOqXui2PQ3/wf4yBHHFELhLaP6AgkY/EPgp6xzZ6DOyOvxlI4OInM76bR3Jx8A6K41K8FrfXYnQw7hESDiDTjAX9IToQ2vG38fixOwQzpOLBAvOG+NMQyI3/XoW6nvl+FmcPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Glvz5BF6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Glvz5BF6"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so1661828a91.2
        for <perfbook@vger.kernel.org>; Tue, 31 Mar 2026 00:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774943871; x=1775548671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M687pClBmyskqhyA00XSquhq2FV7KuuIoAzTg1/c05Q=;
        b=Glvz5BF6mACp6iwLPuBOxLCg5QMT50E392SUMho2h3E3S0VysIi8V+7ALwZPnIPAVn
         JfDKGrEJau0tJSjxcwiZvC7fyfu+XuDxk0L65eKCz8rRIzHGdQpiTv8Ljl0IrPRteI+v
         0+wyNBAQlricWixYNXpXOgkdFYVs23nHTHrbsnSe4cusM/1nShBXxX6dyG9H9IpfP32z
         lGbs3SFrlXbNEHeZeSeup5cy7GU1VwWpm9TQchJ0ap/+Dm6d3jVmJB28LCIcQ/VXrZQv
         RkHtzXC033r5DfGknl7Yvsm3PrQmlqfhM6u5m7AiwrkTN5a9uSk4O2LEytS+3nrKIecB
         SsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943871; x=1775548671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M687pClBmyskqhyA00XSquhq2FV7KuuIoAzTg1/c05Q=;
        b=oQcgngQP7pOfADUruPlb2K0a3n1kn4GPe1jGn2wTCDdVKV9/Fo4kRvatx2XyQVw7us
         tSYbmFeAuyDRj0oagx/R89jp+PpOEA4AvkNsjSuCma4O1OGSahDt4yGGjPNapzJmvsC/
         xgW/kSCqKNo+IJAYpBTo0sRW3V/PyeLuKzdcBv+IH2sAtlMzgb0yPanPJrXXbDOt+gU/
         GNhR9gcOY/9mVBEA0iPshFC0H416zZ6rLpV2VXZpc3PcJ97nzj6fauvgdm9H99PDpH9u
         JyolhvwEO35WN2oG1f91nasqaWU2WjbMUygU6Dp6MMRWvmaENbzNeG5p4Xm8DiRt1j3+
         OFQg==
X-Gm-Message-State: AOJu0YzTCdZkgcARMLmEOnCb0aJNOsQk82WR1GHKBgG0VLd/1TlREfcM
	Hce6t0Csw84hHcK5swUu+NgWtcX9wk6QmbQfExzA/KCAbhChKObP/pnV
X-Gm-Gg: ATEYQzx7xM/lwtKhRCdDt+m4PNrtfOh3YocH+qfgBbPJbapmOEb6pXDV9Av77bph7TT
	4928K5y5hiutyTqp/fRzf6m2kkcvmc7bAAtQNNj2ouhj7A651hdhKLa5ZfVzsFS07J4cHRfr0r9
	JUweNocTAO6eXZBUi7nD+ytj7Bxpkc9h4+s6IdAgaUj8ixM9aU4qz7IbTvDRYH0qA8Xp68bI3PO
	7kpygC1oW1V+zBfs3vKRJ0rz4nqvny4HhcBWYnlEooZsg0i/k+8rw0mgb4WGCWa4wjbYNShTnuT
	wB5JsoAizFIF+BeGvG3Ys0ll7ByT8pt1iuC+Enj29xrbXWpX2tQGt6kzTN4K6Dskdgc5Q61ql6a
	QTSwTgE/cis0DfqBuFNd345lSyF7k9pchsB21L1QRT8OuJOM4yzPKJlkZ4zwLc6FI7pEk2tOZpk
	ROI4MRxqap8NNzyQnF9RemHAP4JXvr0U+BT+MQGUmcFsZKG0FKrTYt84OIZG+0zyXVzKZ5XJPyZ
	BXLFF8=
X-Received: by 2002:a17:90b:3c10:b0:35b:aca5:db39 with SMTP id 98e67ed59e1d1-35c2fff1340mr15053361a91.9.1774943870924;
        Tue, 31 Mar 2026 00:57:50 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe5e5127sm1088235a91.1.2026.03.31.00.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:57:50 -0700 (PDT)
Message-ID: <02bc543c-48c6-401f-8a61-59090c50e490@gmail.com>
Date: Tue, 31 Mar 2026 16:57:49 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/3] cpu/overview: Tweak index markings
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <7304a7e5-2b6d-4109-9387-01fa4015cbf0@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <7304a7e5-2b6d-4109-9387-01fa4015cbf0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Let's make them more consistent with other index markings.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overview.tex |  4 ++--
 glossary.tex     | 14 ++++++--------
 indexsee.tex     |  1 +
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/cpu/overview.tex b/cpu/overview.tex
index 56c843ef..4a3ac25a 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -456,14 +456,14 @@ But here in 2026, such computers are the exception rather than the rule.
 In fact, most computers exist only to respond to requests transmitted
 to them from all over the world.
 These requests are received by devices within the computers system,
-and then these devices \emph{\IX{interrupt}} a CPU to inform it that
+and then these devices \emph{\IXB{interrupt}} a CPU to inform it that
 a new request has arrived.
 A CPU must also transmit responses via these same devices, which in turn
 might interrupt the CPU when a given transmission has completed.
 CPUs can also interrupt each other using \IXacrfpl{ipi}.
 
 Either way, the CPU disables further interrupts, commences executing an
-\emph{\IXG{interrupt handler}}, and once this handler has completed,
+\emph{\IXB{interrupt handler}}, and once this handler has completed,
 the CPU re-enables interrupts and resumes executing whatever sequence
 of instructions was interrupted.
 These interrupts take time away from whatever task the CPU was executing,
diff --git a/glossary.tex b/glossary.tex
index f65f4dff..628e5724 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -368,9 +368,11 @@
 	CPUs are available).
 \item[\IXG{Immutable}:]
 	In this book, a synonym for read-mostly.
-\item[\IXG{Inter-Processor Interrupt}:]\glsuseriii{ipi}
+\item[Inter-Processor Interrupt (IPI):]\glsuseriii{ipi}
 	An interrupt sent by a CPU instead of by an I/O device.
-	See IPI.
+	IPIs are used heavily in the Linux kernel, for example, within
+	the scheduler to alert CPUs that a high-priority process is now
+	runnable.
 \item[\IXG{Interrupt}:]
 	A signal to a CPU that causes it to stop whatever it is doing,
 	disable interrupts, and execute an interrupt handler.
@@ -387,12 +389,8 @@
 	If necessary, the item is removed from the other CPUs' caches
 	via ``invalidation'' messages from the writing CPUs to any
 	CPUs having a copy in their caches.
-\item[IPI:]\glsuseriii{ipi}
-	Inter-processor interrupt, which is an
-	interrupt sent from one CPU to another.
-	IPIs are used heavily in the Linux kernel, for example, within
-	the scheduler to alert CPUs that a high-priority process is now
-	runnable.
+\item[IPI:]
+	See ``Inter-Processor Interrupt (IPI)''.
 \item[IRQ:]\glsuseriii{irq}
 	Interrupt request, often used as an abbreviation for ``interrupt''
 	within the Linux kernel community, as in ``irq handler''.
diff --git a/indexsee.tex b/indexsee.tex
index fe57094b..cad3532f 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -1,6 +1,7 @@
 % effective in both single- and two- level index
 \index{Coherence|see{Cache coherence}}
 \index{Full(y) multi-copy atomic|see{Multi-copy atomic}}
+\index{IPI|see{Inter-processor interrupt}}
 \index{Memory consistency model|see{Memory model}}
 \index{Single-copy atomic|see{Cache coherence}}
 \index{Single-variable SC|see{Cache coherence}}
-- 
2.43.0


