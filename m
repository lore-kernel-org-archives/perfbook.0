Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BB11DF25C
	for <perfbook@vger.kernel.org>; Sun,  2 Nov 2025 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762100338; cv=none; b=Qsr+fdM08AIX+6fI91RLHFvBrb0mgFZ1HmSqMe4zXAkhkvZmKmqzfSXupUtZfwKbm0uqsQaypCrM/OsucOi8TOrtLJ6jX22FaG+1r6w4FBVm7H5r0JHbBlpYfvUEwehMop3/q9QqP1VVso5y9N4u1VPUP5Am2IRgeRiUtYV1KoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762100338; c=relaxed/simple;
	bh=BZGzvU8krYW2LEpQzUv5SLu7cOxEtjjCsUyQ0HLTSPk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=U+PYlUvGaNZQMpJYjN22BQJTTYtWxB/19OwbIfkeK06mjHaFhzv4eqGJmQTKNluZk0A3kFSMA6fvteVpFybKB+Q+Syd6KYS6ZgAUkuLm/vwkqZW4yEM1l7zaAzg89fp52lVeaEh8+B/eeUNBrgjPNt8Ko7slGZlPvPRSULpz7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=PPJkYfWn; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="PPJkYfWn"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1EA95240027
	for <perfbook@vger.kernel.org>; Sun,  2 Nov 2025 17:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1762100329; bh=BZGzvU8krYW2LEpQzUv5SLu7cOxEtjjCsUyQ0HLTSPk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=PPJkYfWnAIGn58DZsPkQuSUfwe+b6enV4lrxrq4wJX8/HF1A3fWWo62JWh2RXl+uV
	 gkaMUxm452veD+ut6vPxJ7uqn9Hn+dfxKamDBdqd8MjI5wcqjH0NWmZQ8lpVk24Ial
	 wdy09zMmfxnLZGmR6Z7v1/CcLQHNmkKVgC6NJgEmYYYB/hn7pTcLDmcIo5cGd5eHie
	 U/33wfMl0ci9eWqCGLahGT3MGcEznPI9tCapGGFBN/WYk/5TAp/cDaPTSP8NkuEiLX
	 Vq9Nt+6nMLH5vSBD+HwjNxhnKl2XCdB1HcwyEK7brdniFxySr7+NE4pl049j1NNykS
	 PvYMk3c11Dy3g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4d00Jm4QT8z6twY;
	Sun,  2 Nov 2025 17:18:48 +0100 (CET)
Message-ID: <2d8e81ccabae3a1d63d1c3df9e593c19f2043f50.camel@posteo.de>
Subject: Invalidate Queues violate cache coherence - what for?
From: Philipp Stanner <stanner@posteo.de>
To: perfbook@vger.kernel.org
Cc: stanner@posteo.de
Date: Sun, 02 Nov 2025 16:18:48 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Paul and all,

I've read through Appendix C "Why Memory Barriers". It helps greatly
with understanding the overall problem. However, one part in particular
confused me and seemed to contradict the previous subsections:

"However, the CPU need not actually invalidate the cache line before
sending the acknowledgement." [1]

Well yes, I think it absolutely needs to. The previous examples relied
precisely on this. What a CPU sending an Invalidate Message actually is
saying is: "I will modify this cache line that you currently have read-
only in your local cache. Once you sent me the Invalidate-ACK I know
that you have invalidated it and I can safely modify it."

A CPU sending an Invalidate-ACK without actually having invalidated its
cache line is, bluntly, lying and endangering the entire cache
coherence.

Now don't get me wrong, I accept that this is obviously what is really
happening. But the chapter got me to the point of interpreting a
truthfull Invalidate-ACK as an essential part of cache coherence.

The previous section detailing the store-buffer, on the contrary, makes
more sense: "Altough not owning this cache line yet, I can store my new
value in the store buffer already because whatever the current value
is, I will overwrite it anyways." whereas with the invalidate queue the
reader just ignores that the variable might have changed.

I guess this is legal because the only real guarantee of CPUs is that
one particular CPU sees all its accesses in order? But even then, as
above, for store buffers it makes sense, because the storing CPU
doesn't care about other values. The *reading* CPU sending the fake
Invalidate-ACK, on the contrary, should very well care about reading
the truthfull value from the cache line.

And if it all works like that, then what even is the point of
Invalidate messages at all, if you can not rely on them being followed
before you yourself start modifying the cache line?

Or is the point that a CPU temporarily ignoring an Invalidate message
can still validly (without memory barriers) use data in that cache line
which does *not* get modified by the other CPU? So memory barriers in
this scenario would allow for more efficiency by "segmenting" cache
lines?


Quite confusing. Parallel programming is hard and discussing it is one
thing we can do about it :]

Thanks,
Philipp


[1] https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git/tr=
ee/appendix/whymb/whymemorybarriers.tex#n1127
