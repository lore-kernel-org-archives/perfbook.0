Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668C2512E4
	for <perfbook@vger.kernel.org>; Fri, 28 Feb 2025 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740763875; cv=none; b=OAbpljKDKLVb9BD56wo21UguaKiFST2MO+0q991gpPN98KszE0/jU5pCoIJpo4nrEVgDFELdeTPCjWcGifcnRgZGNM6rPpTeE0DI6rDyHoKcCsIP7PT4RBW/m8Li5WsqdUph/dw1/G4qRWpm7kogp7XB6jkkdklYKPa+X4qisSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740763875; c=relaxed/simple;
	bh=tf1y/IA7CL2vnhBSgK21nXjxicNW6pRuCRH76RFKAQs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=uqgrdZzF98+rLouqcjRsx8TuVrUT7PNHPvinp9EAfJ/i5AnJjSYVfk4LZeiBrXU4/PlZbRKmadyuhoAbREtADeiAwAHIk1nzTGvezdly0Swji51Iox+oJLBFH3zeF9ttQGGLZcqe5u3yK8OTWQ0WRyD2/BHxNldaM+1SBUwQ9Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=q6ZcmmWf; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="q6ZcmmWf"
Message-ID: <6c2c3199-e092-4909-853e-4fad1ca0f35c@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1740763867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vt0mE4dcrfXb7rwNlsW3GHZMcJXz1OJZpsuUEnHalNk=;
	b=q6ZcmmWfj8pyGS8Lq9R+S5Uyoyxwd5B9RNngI6A+K7utxasuDNW84kFh1BQopSqeZWX/mc
	0daUXz9j1u2Ffg2nW8ls6LmcJR+gCKwr/susNAxQ1ANensSSBvKDKSotUdLILkxUUT5tNM
	6qMDuYXYsrzuwaQo3XMD4L7DEtMTJyh4HX9x6v/ZCUV8ITiVWWqk/qzPcyKOg8D4hgzDKR
	ZzQe7rJl9fOvyrYiRmlB81cH0FB/tAAI/RGPK4m+07ZBLOam13iSGo+/brSvT2PwBC163X
	oNUTL0pIT2G6qMCb7nQvqv151rHdcR0vtOvVJLHrfzX2JaJLNB4f6/1qlCIX/g==
Date: Fri, 28 Feb 2025 18:31:02 +0100
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: perfbook@vger.kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Subject: Is Alpha non-other-multicopy atomic?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello!

I recently looked at memory consistency models with a particular focus on hardware details and
found this book to be great, but I was left wondering about something regarding Alpha's memory 
model. 

I tried to find previous discussions about this but didn't find anything, so I'll go ahead:

Table 15.5: Summary of Memory Ordering states that Alpha is *NOT* Other-Multicopy Atomic but 
I couldn't find the explanation for this. Other sources contradict this statement [1] [2].
[3] Documents ARM's adoption of other-multicopy atomicity, using POWER as an example of 
non-other-multicopy-atomicity but fails to mention Alpha.

Furthermore, [2] models non-other-multicopy-atomicity by having "Read from external" (rfe) not 
impose ordering. Alpha's reference manual [3] Section 5.6.1.5 states 

  If u is a write access Pi:W<m>(x,a) and v is an overlapping read access Pj:R<n>(y,b), u is visible to v only if:
    - u <- v, or
    - u precedes v in processor issue sequence (possible only if Pi=Pj).

Which seems to confirm that Alpha was indeed other-multicopy atomic.

Best regards,
Ignacio


[1] https://arxiv.org/pdf/1707.05923 - First page
[2] http://www0.cs.ucl.ac.uk/staff/j.alglave/these.pdf - Section 4.2.3.1
[3] https://download.majix.org/dec/alpha_arch_ref.pdf

