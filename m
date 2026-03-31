Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818143D6493
	for <perfbook@vger.kernel.org>; Tue, 31 Mar 2026 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774943990; cv=none; b=DN4blAG9St1uosWa3GQAqUfZlRUjORWTXDs4tf+mUapXWbSEue2Oi7PfjhKmDFoY4FOjhZ1OIQQ6V0flXXnKmPfAhPtqBoZgvfWw3saU6lH74hsOAsqnLQ7OEt1rPA0M1OREBnV1uPVU9j09QM8NC29Hca62Uo9df7ntVbO6Od8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774943990; c=relaxed/simple;
	bh=gM1wpyvf7ha/WRTaCfh/A2gDFxzhx2LGsrf8n9Jrg8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=plkYJF0vLdvvPK7wqg+nzAUy46ILaBSn8P1qsgPGY8KPZe9veTTTuDGRuR1DNFeWprvyfxxwis0n90mUXCL+kCOugNTTbndG62lsCRAtqV3Lg8k4IKG1v46tKZrHF5IumURJrdciZ9E+Z5LAID0FdN26gluAdWenNLKR5N77FNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzpKcvpN; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzpKcvpN"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so2449586a91.1
        for <perfbook@vger.kernel.org>; Tue, 31 Mar 2026 00:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774943988; x=1775548788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuX03/4nCde5j4gArKcCdKoSN0q/QhTXUNOQqNKSNfc=;
        b=IzpKcvpNIA159VF6v4GtOXQh8Q6OaFLvmihbrLE1jYTCW37Iw1pb50Z9I0YNT5fuXX
         vu8BNOE/tJ6PYRiFZI/K+bew9PvtSWU9c8jHOM3df+0q5ftqJqDLcoIBDmevVyGJNZfJ
         KBljTH2/n3TzJkIPktCtOexrbNknNLTIhFY3P+eoXFKg+gWi0ioEvPhVjJJjNkpl0dS+
         xLYSViuiUw82zs6EHuaqH6YpjfCTGGWhW0iU3JW83u45Hg0ZDHeywu/Ccsk7xRhhKEhG
         Gt3bNZlFteZVdFzQ20e+2lRAAxFniTZ7MdyiWXYgGV8BVECBIiDbGjgnTPUTKJIm0hQo
         w61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774943988; x=1775548788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuX03/4nCde5j4gArKcCdKoSN0q/QhTXUNOQqNKSNfc=;
        b=K4LpE6KIn0wsYhfEVAFkHC99+Cs86FmjxFRlfkOO6PYzQk51FGs6eKkfDaetR+txKN
         8ibbI2yq1HqVAxNzrXCQZbX9t8Mkctbq65WpkCBcPX6LXThvMXA3SZSWgeffUH2bC/S0
         Ce1H/zVti5UL+ZdekfY+HYwTZ2qmAEwMMw9Zcdo3nw08BS+MKvtJ5ZvGLgwd4H/l8TOR
         ywHgXsWAn90VEIaYYxPT2VnZqSr0qQzrO2H14NVCDI/A4yVIcpS1dFxlgMCUBo8TqqIR
         a4VLjH+kEO5PfIJceCfTibcwKsmikvInvKQk6aXRAtleX1bXoKNRhNC7hG34onhvaFK5
         wQwQ==
X-Gm-Message-State: AOJu0Yx2MTlC1gY9Jsdmh+bCmCR6fwIoUXGsEfyFFElB44Qze2ezW21Z
	8aPBP+4++BY1+ExVQE60x+fzS1U/ddsqI0dGu/k6ErXc+Y8WEyfCB3xC
X-Gm-Gg: ATEYQzwSId76YkwA/DrwUe6q+d/EJBfeBjdT3PlcP7ceGB2kHkkN324cgA12GFBww21
	F83BKq1JJz13Z2zHHI/mLNYbko0ci9M/SBW10MEwi209jtU/dLLawejLh7sT0h/ZDi8J9lx9mcq
	1hgz4dkusm+7+bS7QPXEilA0u/8lZRjFy7/+nPwtVI7FcllCO5iNUPuboQ+XMbi09rubF+U++tU
	IHuSBriyVULW2jWenMI2BNnwfZN8wgO7zOEpyYh6ymU/fbRcgDSL7yTsTTN/jItzRPUCh+Mkh1H
	LKSERTrC75e5pBfUccqJgLYxPMDQLRi9KJLJ28lYJRc555USL6LU9pTYgVhml2XCM03sjXeFqrS
	fTBDIF5V4nSlzp1tbCYPzhZczsukCFwXWU5q6ddgvPjTUNxY4NjSf7+xhsEH4i5FEWkw4zx0dv5
	kFXI1BEjM0xei/1WnRdLnkNZTZBYKh5kSRNMjEmlDd94DdkrlHsJYz18pVSW6aslBbjen3
X-Received: by 2002:a17:90b:4e86:b0:35d:a559:5c0a with SMTP id 98e67ed59e1d1-35db8e88d49mr1999048a91.6.1774943987596;
        Tue, 31 Mar 2026 00:59:47 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dba33b56fsm437920a91.0.2026.03.31.00.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 00:59:47 -0700 (PDT)
Message-ID: <15ce7736-a8a2-4d21-a425-4de4603f2231@gmail.com>
Date: Tue, 31 Mar 2026 16:59:45 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/3] runlatex.sh: Detect errors in makeindex log
 files
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <7304a7e5-2b6d-4109-9387-01fa4015cbf0@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <7304a7e5-2b6d-4109-9387-01fa4015cbf0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Messages of "!! Input index error" would have helped in catching
the regression caused by the hyperref change.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 17d833ad..5346bb3b 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -76,6 +76,11 @@ iterate_latex () {
 		echo "----- Warning in makeindex, see .ilg log files. -----"
 		exit 1
 	fi
+	if grep -q '!! Input index error' $basename.ilg $basename-ppl.ilg $basename-api.ilg
+	then
+		echo "----- Error in makeindex, see .ilg log files. -----"
+		exit 1
+	fi
 	makeglossaries $basename > /dev/null 2>&1
 	$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
 	exitcode=$?
-- 
2.43.0


