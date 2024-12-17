Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A91D5AAC
	for <perfbook@vger.kernel.org>; Tue, 17 Dec 2024 22:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734474189; cv=none; b=r6wVpEb8gI/Xa2ECGodDPlX2aIHtp+9sAeuqSjh7aBlBhYpknMmSJZJY49SRwYmYIE+EKihATaNkxonRXxuv3rM2q7ZIT6guiTRv/BtwtxqeKTj657bnHbJWZpG1kdPoNEBxSCxQ7Gud6c+yGabKg0d+s1YjidReYHu5wAAardU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734474189; c=relaxed/simple;
	bh=o3X6SCz81/CKxiwiGnoAVWG1xWWhqq0ntLdTCbJ/s5o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZYIL5eGSBUmX/GKo0x4GJc2IbunAlWdVSZ7AOTtMNrLFpmTNhyljkQYn/pm9DEfZ5BykkJfaYR4xsWOGx0F1IDLGmXQffpD8bDAJAU41vASrexkcgqCp5C8pZjxzcndJ59OCd7LBy8qCVgxk59NINJC0LQzNnqMcnr0ZrxAfKAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dxuuu.xyz; spf=pass smtp.mailfrom=dxuuu.xyz; dkim=pass (2048-bit key) header.d=dxuuu.xyz header.i=@dxuuu.xyz header.b=jUULbFK8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XdDWemPA; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dxuuu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dxuuu.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dxuuu.xyz header.i=@dxuuu.xyz header.b="jUULbFK8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XdDWemPA"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id A07F013801AD;
	Tue, 17 Dec 2024 17:23:06 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Tue, 17 Dec 2024 17:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1734474186; x=1734560586; bh=tM9c9img31rI6N8MlQ5vK
	wjXTxsedXEnmBP/i1uz1RA=; b=jUULbFK8S1DvZuUAC5HPol74j+FJ75DUp+elk
	UcjCqY14/BR/RIiRpp/wqlVfXNgzMZWsxrIKJZWhFJju9S/9k80Sr8LTVc53tKT2
	MiMOsmekiHepWPmiPGEKy+DRhrjGY0dnGHePTDRyuj5niglv+F6ORfO2m03zeeLF
	K3/mWTnmrNzyPADO3lg/S0Fsoi/+HBY4i62L9yP0lgTv9BZnaH4AvNBjSF7/9J9/
	x6uap5P4XMPLYslDyl3t9FufPMcYGfE43f/H/iS26BXJHhNQMbrktK4pmmP0QB27
	utXXqoc8LQCd8W/Z51uIdBy1LXOCbL8oBev0mEevmAsW4OvYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734474186; x=1734560586; bh=tM9c9img31rI6N8MlQ5vKwjXTxsedXEnmBP
	/i1uz1RA=; b=XdDWemPAHlquE0Maw08BE2iylBzqUnmczzdniyJDXcHkPo0zB7r
	hMAAajg7m0BVaShPLlvFKfgtOKBcHJMzwoxEa8ga2H+sO+N+6yDf8Q5dJXGyUGRG
	vRetvzOHd66D5VOrUbqngqwHpDmVLQ53aaMbV8dGdyOHF4UJUQ5UMun5p0Oexxg1
	gY1TlGRSTwauuRdF0jAbnKoj7VQi8bd9FZW2cmPiFxQySX0yOhb7exyuvItVU1Hb
	gfzk6GBefX4pm1ogaivSeNPMzVNWYLmMRY0Gxobqs5RYQ+89WmSZBIxrGA7donsx
	rgZ5f39lohNYBtgpJK4WJ7DNYTComtjBDSw==
X-ME-Sender: <xms:yvlhZ6PsqFQmGIbfnu-a_cDeUWuQpm3wgzpiqR68aPX9RS9NIRgT4w>
    <xme:yvlhZ49PwZhw3qOF4nUewTAmI5c6ftFDjhsTmLiRcE8Epf3VFe0R6k0s2vjWsnPdb
    kx8uSlfc_WWzR9Exw>
X-ME-Received: <xmr:yvlhZxSy_QgvQ-saWVNbNV8jYh_x0je2TGAf58drB5EbxKk_2zUa980WFID56xWabsngxeMll_zjDkJMzKp_azY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleehgdduieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlje
    dtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepffgrnhhi
    vghlucgiuhcuoegugihusegugihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpeeiff
    fgledvffeitdeljedvteeffeeivdefheeiveevjeduieeigfetieevieffffenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegugihusegugihuuh
    hurdighiiipdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehpvghrfhgsohhokhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hprghulhhmtghksehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:yvlhZ6s2VokL58vM9NIAoEedaDtZI_G3DswWqBazknFOmgAWJDkpbA>
    <xmx:yvlhZyetutqZcpjZpCwCsPba-p7kTu1YVUWvAsSlCmMSEYrl9Eq3Uw>
    <xmx:yvlhZ-1f58sePzwIzqAZzU0Rqakc_25K8HMGXUafhHwYEnHyiHKOUw>
    <xmx:yvlhZ29XzBg89YbrN6jAOBZnBpQ-VzGibFCsuuKb7VGqhvnp-Crgiw>
    <xmx:yvlhZzqYCSD5FNhEK2je7UXNYdvgiCvjYnbucMooPd_tUYXsc07gBEo5>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Dec 2024 17:23:05 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: perfbook@vger.kernel.org,
	paulmck@kernel.org
Subject: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
Date: Tue, 17 Dec 2024 14:22:29 -0800
Message-ID: <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WRITE_ONCE() is needed here to prevent store tears and other unwanted
compiler optimizations.

Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
---
 CodeSamples/defer/seqlock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/defer/seqlock.h b/CodeSamples/defer/seqlock.h
index ec00177b..842d10a6 100644
--- a/CodeSamples/defer/seqlock.h
+++ b/CodeSamples/defer/seqlock.h
@@ -60,14 +60,14 @@ static inline int read_seqretry(seqlock_t *slp,		//\lnlbl{read_seqretry:b}
 static inline void write_seqlock(seqlock_t *slp)	//\lnlbl{write_seqlock:b}
 {
 	spin_lock(&slp->lock);
-	++slp->seq;
+	WRITE_ONCE(slp->seq, READ_ONCE(slp->seq) + 1);
 	smp_mb();
 }							//\lnlbl{write_seqlock:e}
 
 static inline void write_sequnlock(seqlock_t *slp)	//\lnlbl{write_sequnlock:b}
 {
 	smp_mb();					//\lnlbl{write_sequnlock:mb}
-	++slp->seq;					//\lnlbl{write_sequnlock:inc}
+	WRITE_ONCE(slp->seq, READ_ONCE(slp->seq) + 1);  //\lnlbl{write_sequnlock:inc}
 	spin_unlock(&slp->lock);
 }							//\lnlbl{write_sequnlock:e}
 //\end{snippet}
-- 
2.47.0

