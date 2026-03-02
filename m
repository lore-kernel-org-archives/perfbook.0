Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6483938D007
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443001; cv=none; b=ZXp1lbrX8vs2cDvTbMbEgItNO3Al3ZaUc2TQXxFA0G/5cPLxoa65Mf43tH5UW0FarYH5H840kIAierQ5S1XsH9CgauZKzCDJJI8TRIDimYT/oxoq0xug40Pt+bu4GOujbLJZQGAt749T7JbM4B2W13Cc388gz9eK9oyIcIOJsKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443001; c=relaxed/simple;
	bh=NKwfJO7jeJT1nl5Jq4dYVJGhGeL246zQZ0Ks0rqAsgU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=WDjgYmMHmgrF+SFhXoyAn+JyZpW0uO4dbYMXORRbuCp6cxdqGLXGImS5WBYkmPHIlCpc9MiJcnyVqDWKmwTDAiSu+7HgSPu689dzBhncmR+MbZ+pKLP1W+mPUJShM+6j8ZAKeht/XBBaYX44iLvNzrGCYNw7CS/n3UjytqBz3pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItyaoX6D; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItyaoX6D"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82746ed8cdcso2432481b3a.3
        for <perfbook@vger.kernel.org>; Mon, 02 Mar 2026 01:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772443000; x=1773047800; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVJsnW1ng78f8lF8yAigZjJsCYdf9Zr3Ub+uPsy6Xkk=;
        b=ItyaoX6DKuNi/HxN9lJgm5EvNNwgbnu/dFHIxcjdfT+1EVTwDiKIx9w5GaBOriOBPv
         tm4m8uZFeRmpf5q1wwAmQRsfp6/5hJqbTwBBqhEmSY1Ok7gGDwVteVJgSxdlGFPL58WP
         LX1+VcOF2FOfAkS9nNTDXj0AqWRLNJg/rqU7HA9uFk6n61/HPG0+AUJgoetID9B3PZI8
         Y1UOprljHoxybY85WFiCQ1fpcuy57XoQYk9PnQ6dLJLWp/w7zcA8IRVYTSgapZMnYgsq
         e6/kInRhnOLhydWw9WaCzYSHllGQfyP4b9HDox7y+Mbb5L8r72xByq9RezYSLxTe4AQO
         W8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443000; x=1773047800;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVJsnW1ng78f8lF8yAigZjJsCYdf9Zr3Ub+uPsy6Xkk=;
        b=ecxfdhrJfBIQ5wqJI0l080NvByBs9hzs05GL4WmpVm6Tnoc+6x2NpgEonEt041igY0
         vKsVf2rJdIAM/S1E+3Y6KFgn6M5SGON64zNdGldLKx4JW9/izkricVYlf+0PE0ijj7ii
         2NTd7DlDKfHOrqVHL8tt+TUFSwYPGA2nLLZ80q1HxRBjM1FP8sy9pNEMPP2sYqSrufAL
         XhXqfyhezOjI/Rc7ffxP0VlPTspUwroPDxABfTAoIHx93jkXzBCE13Z5MHeBNBYMA2ey
         q68GPQC/TwGVTwE0ae9rWECVt39QgJ58eEPRMHHRWTKWdoCvLEcOWzl3iEkzcEKsjRK6
         C3Cw==
X-Gm-Message-State: AOJu0YzWzvToCAexNBMGMfThBdkEus3O1D/VUWsI3Be1wani6mjXnWOQ
	FfnO0mw+XXqyHQiHfrzTwoRVSfE4mNK6WWdl1OC9lbuWM+crAYqTPEyx
X-Gm-Gg: ATEYQzz6oRAnpfu4iEThXRMVesdJeo3enrFMNFNKIkhEO+w98TYTwS6hiVJJGk9SnhR
	Eg5G3YjpX5JzbWJDzLf9ueF0ysm8vml1JC6W/c1b2z0V9TCKX2ptIwjiOk8MBXLBf91PhWMzKtp
	D0/h1gevfaTTsAB2bVRSpJ3PhOr1/rpZE2J7yMYq0RCs2p/aYvGZ71ngCdkv156ISJGq7rB+9Xc
	8IiH6Lcm9pU4uxDtb3Zi3caZuKw8dtRMdnpazYHOT6xLgaTlw/ZPFI7WVl5jN3oAK+YOgFnbWpy
	gosA8Ff6rKbFma8CAQX3WjKvy4FW/eyyvSouq7kAVn3oOjvZP22XF25BO8GUalwPZoWylaT1Z8a
	Me3xDEYCc9HRy+0S7d/N5E4Erl/Cts3N6/ndX+DdpyIF1wzdBcesLOTO9zFF2RCCJW2taEEdkB5
	cHb3dEqeS+h9pjqQJWpUKGCErsDnc1GyHrzwL4YDkbsomuDZkp0ytIdZJwyCoOfKezeo4S
X-Received: by 2002:a17:90b:384f:b0:359:96f7:a016 with SMTP id 98e67ed59e1d1-35996f7a15bmr166252a91.33.1772442999687;
        Mon, 02 Mar 2026 01:16:39 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359956d8e57sm779168a91.10.2026.03.02.01.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:16:39 -0800 (PST)
Message-ID: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Date: Mon, 2 Mar 2026 18:16:40 +0900
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
Subject: [PATCH -perfbook 0/7] 2026 March updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

Here are updates for March from me.

Patch 1/7 is the regular one.
Patch 2/7 takes care of legends' position in the plot.
Patches 3/7 -- 6/7 are aesthetic improvements here and there.

Patch 7/7 retouches recently added Figure 2.6.
I'm not sure on this one, but I thought this might be closer to what
you had in mind.

Thanks, Akira
--
Akira Yokosawa (7):
  CodeSamples/formal: Update rcu-test.dat for v6.19
  formal: rcu-test-ratio: Adjust legends' position
  Give page number counts room on TOC pages in -1c builds
  defer/rcuapi: Tweak column widths for long APIs
  Adjust page header/footer widths for tweaked textwidths
  Define pagestyle (of titlesec) for section-less appendix
  intro/coarsen.svg: Tweak size of squares and use nuanced colors

 CodeSamples/formal/data/plot.sh      |    3 +-
 CodeSamples/formal/data/rcu-test.dat |    3 +-
 defer/rcuapi.tex                     |   16 +-
 intro/coarsen.svg                    | 1403 +++++++++++---------------
 intro/intro.tex                      |    2 +-
 perfbook-lt.tex                      |   45 +-
 6 files changed, 627 insertions(+), 845 deletions(-)


base-commit: ed21d3a85560e4e4088f55c19f860b040a805bd2
-- 
2.43.0

