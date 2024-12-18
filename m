Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4579C4
	for <perfbook@vger.kernel.org>; Wed, 18 Dec 2024 02:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734487460; cv=none; b=lOW/mi9npbnfJgFJCVA7EMjQCYKiBPwEPjXcCkSUwflrQ1wj+9DY2XpGueSlMW10PeU/MnHcB3kv7DciR01smcJ+l+OHU9IgYQ8py/GXtjTmEtbXD29YWm7DZCyyUYHfkqDLaffc7VAnuUcEEydOTaD9Nu+WnPXD3xWCsxDI3QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734487460; c=relaxed/simple;
	bh=ZTVMOzTjiXdlF+CEVNSv1uxKgoFg8kSDGZqRI1lOUZ4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=brVFWPJmxc87VtqGQC1y9QR3ihoO3j7IY8SX5PL5q3ly5uu/8E3YORGnU3aMNd7BLKN2GFwypv93SBsIxFb6oT/L+vzSBpmKDkff2SUafQolrI0Gk69M+OKdnsAKcCPYCZ3dx4jpMnxIisJ/hvqFtxrtVxHC4rFynD9R9OAXnKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dxuuu.xyz; spf=pass smtp.mailfrom=dxuuu.xyz; dkim=pass (2048-bit key) header.d=dxuuu.xyz header.i=@dxuuu.xyz header.b=QXO9D0lD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kO6VpjlC; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dxuuu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dxuuu.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dxuuu.xyz header.i=@dxuuu.xyz header.b="QXO9D0lD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kO6VpjlC"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5AF9B2540169;
	Tue, 17 Dec 2024 21:04:17 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Tue, 17 Dec 2024 21:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1734487457;
	 x=1734573857; bh=ZTVMOzTjiXdlF+CEVNSv1uxKgoFg8kSDGZqRI1lOUZ4=; b=
	QXO9D0lDGqFUe2U38SbbDmhgXUeZBhXHYqPcOvQEykAI5R9W2mZFTpCpfjAM8M5o
	MlIafMZTOMQsmgObpn9pPLxvsu12XlRH9xIDVhISDRlxHLcTgqCNMEN7UEyYo7m7
	nl5qLTglAn9CRfjEgF+OnOmGWlTY6V54wmsuN1pdussbbU4haExl+EWvTkDLrtEm
	ND73orlZ7gCs19C2/utg1FzzAoYWoO241PAhGlORXMNaNZeal67WEfQnLkBGFTNf
	MtLK1AGbBzUKY1LA3JE+Q/zuILSnrFO6lhDoK9OSZvB68a12qmrVzDwyYBZR/xyl
	SSjTokDDbuBV+102Hh73OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734487457; x=
	1734573857; bh=ZTVMOzTjiXdlF+CEVNSv1uxKgoFg8kSDGZqRI1lOUZ4=; b=k
	O6VpjlCGESxoLwvCQd8r1rvKP6w3fM0oypjGjz6lck+TyMZ14aC8K8QCSHbXOut/
	BqHnyMNWr1ciLpL2ngsoHb6zrgVhZv8OopAwXdY1FT1HS//if6+SoqysZ2CkIo9B
	wbHW8MOkO1lI7Gm0kb9tKeUNVvy4t77PLTRwGLM/BxcWllHvjEk0UBwimh6wT7jH
	Gv2jmqZ6e9ptKDal0/Itr9HjDVwwoK/KqmHhL+YNXK0TSYr6nRvdQKx+2nPoxjX/
	j0wVw90VtqNyvqVItmG8RedUgMdQwYpwbPYl3dKRQk2BAZ21j026YD3eUGc0UKox
	rBD2Fyv8dcTOl4FAhRDVw==
X-ME-Sender: <xms:oC1iZ-ZETrNfUHaIcenrv-9SYcYUuaGUfqco-s5nCiXIgPpIyd9_1w>
    <xme:oC1iZxYWOOolCKzBZc7m9ckaLMnPNDKECODKmVc9OR0OGG1Sg3KgdgyfvKjQVGL1Z
    Ol7DQgXhuwyDUUOww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleeigdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenfghrlhcuvffnffculdefhedmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedfffgrnhhivghlucgiuhdfuceougiguh
    esugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepgeelieffhfduudeukefhieef
    gfffgeduleevjeefffeukefgtdelvddvfeefiedunecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihiidpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghkihihkhhsse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgvrhhfsghoohhksehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:oS1iZ4-DYYWXjVkJ5DS505N9wxDPZN-LE480C6vOgWqgl4m1_F3_BA>
    <xmx:oS1iZwrqbvWDQkwnY0AwVApl2Vhi6uvGHCypwAuciO0oQvdUN0tXLA>
    <xmx:oS1iZ5pm-s_m-Slk4YwF8HMTHpc03Snbbj8ep4HT6khC8eP2DIJeNw>
    <xmx:oS1iZ-Snqihb3NhEpDpiVUYAnOdXU1EKUYx0kCiQsPgcjMgwm45Vog>
    <xmx:oS1iZw3tDYxFoM2tEGJ11-O3vZOffXqEFexKjnbATz_z4muZfUZ2ojtE>
Feedback-ID: i6a694271:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E188918A006E; Tue, 17 Dec 2024 21:04:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 18:03:56 -0800
From: "Daniel Xu" <dxu@dxuuu.xyz>
To: "Akira Yokosawa" <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
Message-Id: <bb8ad6dd-7a9e-4288-9b11-c173d318a87a@app.fastmail.com>
In-Reply-To: <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com>
References: 
 <3a7519aaad6329084fb4f8e6acfebc8f05924bc4.1734474057.git.dxu@dxuuu.xyz>
 <114890d2-e51c-4bb7-943d-9276c6e3de93@gmail.com>
Subject: Re: [PATCH] seqlock: Use WRITE_ONCE() on sequence update
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Akira,

Thanks for taking a look!

On Tue, Dec 17, 2024, at 5:53 PM, Akira Yokosawa wrote:
> Hello,
>
> Daniel Xu wrote:
>> WRITE_ONCE() is needed here to prevent store tears and other unwanted
>> compiler optimizations.
>
> That might be true if there were chances of these two accesses to
> race with each other.
>
> I don't see any possibility of such races.
>
> Can you elaborate?

My understanding is that read_seqbegin() and read_seqretry()
can execute at any time. That means the read side access of
the sequence number can occur doing an increment.

To prevent the reader from reading a partially written value,
we need the WRITE_ONCE() to ensure the relaxed atomic
write.

Thanks,
Daniel
