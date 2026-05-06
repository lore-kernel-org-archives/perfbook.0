Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756611FCF41
	for <perfbook@vger.kernel.org>; Wed,  6 May 2026 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778068028; cv=none; b=S++NcGRDa6OPO6bPtMzwSpOBCJG7GWxtGLIZGCWqkmqq8HLIyDELzAcZqAYiQMFb23t0Cjc3zOdelDg1us2XAQQo1pgGiUEjLDCGI+mSOEwXwIGqjVYBIQud3M7XsZ308i0NQ7LSK+oe82iG1eE0G3hmP9/Wk4gS1gOzR7ofHfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778068028; c=relaxed/simple;
	bh=cWaiosygwAcNbA5Ip3N+v+stDUwoHgY2ibDJdMJiI/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P30fM+WBnhf3L3OQnBgyb4n6Xnqlq4UFbT78uZD3QH3PxQmk52Avl5jcIEsT0kgth1mqW63mteBEJCnPkyOSe1qBoZDy1z8mRVjWMHjir74oPPrkcXP1sK90VzZOLpLYTLDJ7NGwGbhrcEi1deKbgKe9G0LL1DXwEpy3bI4590w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WS3bS7hD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WS3bS7hD"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-83975e992e1so933632b3a.2
        for <perfbook@vger.kernel.org>; Wed, 06 May 2026 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778068027; x=1778672827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiHJtef9fAM9ZPavv/dTns/WMofCaTKS/3p42ZpMGWg=;
        b=WS3bS7hDKGqKQZ6XRzpIqIE4lZQnx2nMPGQyPx+KgjrKrRQKnh/O/uRjWijEu8xCpW
         ByCg2yxJ/PBqduMd73E4NsmPABwXtr3qN+oCuLZoIO8uitf1l0jW/I9wU5xS7marenZ1
         LLC1cKGpRpvyJDDjUQTrRUbK78eszMzTbaf7EvEKgaoS8+pHHQ8j4luqAKab46YKoFwa
         7/N/RL6u1zI7Lnl9hzx5cuufxVG3ovfOACjKxwfrqQffhhDOxqN9WCCDO6s5/VWX/TqH
         pFtQw3MkNHD7vZcUJb48WsEf4+GtyM/2JKPo9JiWwXHCjzC+/tRBPUbc5CnV5oEVYJ9v
         jF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068027; x=1778672827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiHJtef9fAM9ZPavv/dTns/WMofCaTKS/3p42ZpMGWg=;
        b=mt30FGT6LwPj0cc+QZ3MY0naBOl7tqhXOm1Ke9S/kR/pi8/XU5Z2ydoIzPpoK6gKzB
         USAFBhfep+w5KZsi95g3Sk9kpxH4XRfu0yhRgIhvnN+/deh2H/LKD/w7vnprM/9xyc35
         X0qIkhqA3ieuc3m7cbd1w64phQLS7Zb7mwwYdigKahHe0952AIwvGOh9SlYxY3kHbmlh
         31bqMpKzGpggB66RIXrv0O0aN+wI9D803iA/k6KLmADv1nTPiVxBbebmq/w2S2dcctAd
         LKD4WfS3qw0emIxRNYIXqindKqhIW76Kn9ovakV8bp8xcrhPWLmEYo/n1wmxGMdixmVu
         MXTQ==
X-Gm-Message-State: AOJu0Yyi0Znkt+05JQLUddXueElAwSYtyFg0+CFXmJ7vkZT5H8/tjpic
	1SP8NNcIkD2niK/gagcqDqgoFA7+tE8Oy8cgpliOGtKe6mLjr28l03oAYMf08Q==
X-Gm-Gg: AeBDiet6dvNyIu+RT02hpvosma/h4SkmefZSN/8XyrOTVLJRLYYL7uBwQWWOAQDJZRD
	StcoKVG6K+6Lhp7d7imVwdTe4MFB8A3GhwXymGYlr8bDJYoxZjIk6807qTeei3ZAxOhq9TFl4G6
	J2LYWdKWjRbx9MP7HnhrH2omr4ADg+lpoefcPqD+SzcR+DbdZsmJLna4dt0+5zwT5vuWLUhR8Tc
	mQHqVcnNxOI4Trlk7a6F9sNXBWjtKjvsMwcH8PxHIzZbYC+ghSAL04keawRLnVSkTMFp/Bn/zmq
	w3qTI2Gv2bdvbKGN35zClk2Vs8xLILcEySnQ5N/5DZHQWwfuqA47bndUf8+xOSTCyQCizTdmto2
	Ws3yqhXWTFrJLEkAbMrLzCoCIRezeMBhOVTyfPAg96oUbxv9gkc9ml6yCCxCnWcddiQbfeZDnO/
	qTG7L72mLnC+GbgRtAqy9t4VrE5YSMRQ+8aaN94UejezA39T/g0pdp2GybQhk6F/fg+lGk0O71U
	w01Xt8=
X-Received: by 2002:a05:6a00:21ca:b0:838:1c02:2763 with SMTP id d2e1a72fcca58-83a5b3ca97dmr2638389b3a.9.1778068026710;
        Wed, 06 May 2026 04:47:06 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a103esm7135429b3a.51.2026.05.06.04.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:47:06 -0700 (PDT)
Message-ID: <c0ef8976-1099-4c1b-bd73-e2f5ff716f26@gmail.com>
Date: Wed, 6 May 2026 20:47:08 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 8/8] FAQ-BUILD: Add needed packages for Fedora 44
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <e8b6b390-7034-4d01-a565-8d5d48309a05@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Under Fedora 44, a couple of essential packages for perfbook are
missing after installing distro packages for Fedora listed in #5.
Looks like there were some changes in dependency of TeX Live
packages.

Missing packages belong to texlive-collection-fontsrecommended
and texlive-collection-pstricks.

Add them in the Fedora list.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 036f1063..6845db14 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -53,8 +53,10 @@
 			texlive-collection-plaingeneric
 			texlive-collection-binextra
 			texlive-collection-latexextra
+			texlive-collection-fontsrecommended
 			texlive-collection-fontsextra
 			texlive-collection-fontutils
+			texlive-collection-pstricks
 			transfig graphviz librsvg2-tools gnuplot
 
 		On other Linux distributions such as RHEL/CentOS and
-- 
2.43.0


