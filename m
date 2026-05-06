Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD18C4266AA
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067431; cv=none; b=o2qXHQbUcxgIF6PihpvZO6Hvznx66dp1QUlqumvosecANPoue4Z8QeUwaUsbB6ana3KQGxRXoQILgeXa24alXwjH+WL9XtEbf8jotq/nI7PyleVlJWcN2e6K0CPod9JYSzrygjJ2FZ6z8mPfkBzfW9zu+o020vcR8/E/Qsn0zSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067431; c=relaxed/simple;
	bh=dvobAfQs/fPT4fq02+4aZol2uMYWiUepmo6B3/r8pKk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=adAB4JlFzH5fLFuK8WiLYN+uxS5Z6wJDsLki/QDZs69zI5f4k90wPpU5pHxzN6lenhcOqUIZETEAnCGXiXuwX2GWvdG9Elgn3SCqwOO+U06K9uY68JlJlfvXxXH/AN8+4K8jira60o2iPaEaV5zvOeiJjgNwmvDJ0fDcs7GraE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrU/LxLl; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrU/LxLl"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-835399c11e0so1636007b3a.0
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778067430; x=1778672230; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkdN0U3juFepffuR8Qrhj2FFKarVx050BgomOHri85s=;
        b=LrU/LxLlcIc/jmDk4Pg5aklYCZwDSRNKDH65PxppnTl7KFau4GnkWt9t/HZcY3rhzC
         x9qEhKD79fYk5XcqYBHCvLYMYVkZbL690oc+nh0QAH2a6fkmGEzzHKxtfAAngYBKwv4D
         XZGDZDxe8NLYHrrnkPGjLIne60w6Km9tYu1q2yP0gpg/GoivtzJ3FlNHIjwub97xhkHB
         4Npyq5h/dv6qiRDtYQenpj94aEbUDGmdwca8L+OAuSVKug8cjvBsvkbrbp+1A35VkMvA
         qaWex+RhwKdjhEYxzDJN6v+6QoWgV219txY0qk06qYOdhEewEAbgFs1++qmNfY6DOo16
         dMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067430; x=1778672230;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkdN0U3juFepffuR8Qrhj2FFKarVx050BgomOHri85s=;
        b=gZEcaU3DiOfqRZlORTesot/m7qyBD+z0gvkGPSY/Rcp5mo9lctJWQSMyYeLtl3Iz1Q
         ayH5nFa6l3jglBzrudFcVUHwFpPWox9iSrMO8d272qZlcKGu0FAwTkMIcruhRVqG0ywh
         f559oWgNNbda1HkEm0YP62QWQcrgRtSfmgbgdNBgmwfwvhNRAH/18EmvVN/XPYydH7d/
         9QSLBeILMk9p3grRsp1nvWd34ui01SbO53n088jfmckoFJUTs1lEBMmNXRp7ZGKBqQFR
         7M6ipXgXJP8delESQxGmVYnEkpUEnZZj6y27+WVBN6N7NE4icBKFHadeIwrrN8zr2UR9
         umBw==
X-Gm-Message-State: AOJu0YxOtWeeHNXb+VcJEymqRIC1mQMFowuatbSjh+Q2KF7D/aqnp3E0
	E+bACXqEOwObGKxMAPJ2Xv/P+ULs2coMrvVmB2V1w2YBji2+qZt7mS+MXYuF2A==
X-Gm-Gg: AeBDiesWk2dnT0U8HoQ4pouRTTcCIm4sbrob5sk7LjVXtiWAS+h4cNMDuIFCHi3xH0V
	5WTBjouswjH1gL8652bDcGdA1eL0+3j2fH2FbJW5z9Y+PLe7wCA98JcavGHK41R23Y39DnTH8u6
	tzQDxR8ZPwICFRcUACLO7WdyvRhI/SmW+T7GKAS7Qh2tAqIdVqL86rwxSiZ/IynVf3JPWtXVCb9
	GRvAJvWLaedF1xvX1A9USFSrwR8dyEGRc13Rm4pvInOaiLxXhv6SQTxKxdNHNUiTCa/dtiE8ulk
	pCM+bzg0AojlT5N2xaKmreJ0NRYzCvlXGUtkwuIlXZSW00woPiXqRF1OXFGUAmdDYMWc3I1pxol
	IAoZ+1IA6AJ7vJ2zaiX7fbytob9MAhHpKVccgfyPwqB1dv5f5PAHuEfpHdvNsDirmINoLrgsl9/
	dAhJ+7hAeXPp1N5nxUYbVjItyuJyPmh7WkMBl6i4ko1bj7YRkcAyryNpEvkqS1vhQY6D5iyEaHq
	Hs4FjY=
X-Received: by 2002:a05:6a00:cd1:b0:82a:190b:2225 with SMTP id d2e1a72fcca58-83a5d09a86dmr2946599b3a.31.1778067429920;
        Wed, 06 May 2026 04:37:09 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d34872sm5321572b3a.22.2026.05.06.04.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:37:09 -0700 (PDT)
Message-ID: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Date: Wed, 6 May 2026 20:37:11 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/8] May 2026 updates (1st set)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

I guess this is larger than what you have expected.
I didn't expect it, either.  :-/

Patch 1/8 is the usual update.  I see there were some cleanups in
RCU code but would like to defer text updates to you.

Patch 2/8 takes care of a regression in cleveref.  It started affecting
perfbook as early as Debian 13, which I failed to catch ...

There's been quite a few other issues in early testing under
Ubuntu 26.04 and Fedora 44.

Ubuntu 26.04 misses an update of lineno.sty dated in March 2026.
Debian has updated TeX Live packages under testing, and hopefully,
Ubuntu 26.04 will follow suit soon.

One of Fedora 44's issue looks more concerning. Please have a look
at Patch 5/8 changelog.

FAQ-BUILD.txt and files under docker/ want further updates, but I'd like
to see how long those issues in distro packages remain.

Thanks, Akira
--
Akira Yokosawa (8):
  Update rcu-test-ratio for Linux v7.0
  Apply hotfix for cleveref against recent LaTeX2e
  Cope with iconv without ISO~8859-1 support
  precheck-tentative.sh: Detect premature versions of "lineno" and
    "microtype"
  runlatex.sh: Add WARNEXIT variable to make "LaTeX Warning:" in .log
    be ignored
  precheck-tentative.sh: Fail early with suggestions for Fedora 44
  precheck.sh: Add check of missing LaTeX packages for Fedora 44
  FAQ-BUILD: Add needed packages for Fedora 44

 CodeSamples/formal/data/rcu-test.dat |   3 +-
 FAQ-BUILD.txt                        |   2 +
 Makefile                             |   1 +
 fixcleveref.ltx                      |  12 +++
 perfbook-lt.tex                      |   2 +
 utilities/precheck-tentative.sh      | 106 +++++++++++++++++++++++++++
 utilities/precheck.sh                |  40 +++++++++-
 utilities/runfirstlatex.sh           |  15 +++-
 utilities/runlatex.sh                |  27 ++++++-
 9 files changed, 200 insertions(+), 8 deletions(-)
 create mode 100644 fixcleveref.ltx
 create mode 100755 utilities/precheck-tentative.sh


base-commit: 5d4a155828dce1cda2fa1a2769462e9a11838a70
-- 
2.43.0

