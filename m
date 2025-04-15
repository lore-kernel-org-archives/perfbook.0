Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1C11CEAA3
	for <perfbook@vger.kernel.org>; Tue, 15 Apr 2025 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708610; cv=none; b=bng2iL/xSkr/5mQKMTh61TD0AR8PnswynQEj0/ITi7sHQoTeGhKLWv6WKBAtWRiC0rf8j1tpvyoXCu4qy1ykxavis9h1+3TdtBbu0aAWRQynBnDZXxcJtKa5Y9iPlzzvDBJlfnD4cm/MBvslO29VEaTTaaIGTMnB97DD2Fo4AfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708610; c=relaxed/simple;
	bh=saYVWmO3M7FmNhmzxZootD/lJC9ymr47t+eVpWaAuj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYT+4TN3g1PObYE9esZpvwgOT6KlbLBFp4kOsJPTxWghH2Y7E56XIevL46Z9PruGQ6SCS1ekCW0z9o7YupUga2QYm4iSN0JGccyWQq3LPXGTwSY8ebUmLlFCR7pNL6q+/cBdxEBZzM0rF+S58HMBJ1YKm5BJdy8Sm9gk3SRm4U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSOXoOmH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSOXoOmH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4526442b3a.3
        for <perfbook@vger.kernel.org>; Tue, 15 Apr 2025 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744708608; x=1745313408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnFJ+QzqcKXHUBWxFEcyJWtb7Sgdy0YTZ/Gbbcgo+6o=;
        b=QSOXoOmHMmViFIvAWGEKNo9fStTugMpp2tEuUkFcWoE006v+WDm3Bod+VQX93An0vt
         h/42ZD8W6SOgg83czDe9n2UE/Hm1ZsngPUE14vfsN2xUOZBgme6mkoxLBMrwRoWBspS/
         KzyabtCxq42qu12GFl8GHyIKVFE7S9/zIEjQsiLwYPYj2Ob/k2RK8+6mePdmDfD8uWOT
         6H+DwnHsikX4LpGFj8kWpIu2Dm2ZshRtd3muV+jtg8bTBd95Gt+goSJxVXcBp2k2pKZA
         KLYK09ETGBT0mXxDF6LDeeqYuYspYnZ+oXLjuBIy7fdZWoRZadlf6uUc73TN20QOoQCS
         KP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708608; x=1745313408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnFJ+QzqcKXHUBWxFEcyJWtb7Sgdy0YTZ/Gbbcgo+6o=;
        b=IH+yfyElTOnZliE9GGNJIpR9h2FIKCDpWgH6+WPSUsb+usz+u22iePrwMeNTfxsq34
         mhPFXgAoA0K6oou2/30o/Ictm1tvbjCOkg1oL4JuR+HTCZV575tcXfvQJNVAi7jk0Aj9
         gJmvZJ4cOUeneQjEnUQmtF3f//VANkrjUXLWJaHH273/Zb/Z1lTQlUQMGEsd4mYqbqGA
         8w/1OZw0S2B8tLJRulWQ9VSm6PdxDDNUf/WH9zGDrWlkDAfyf8Y5g4Bj2yulXW5k7GL2
         a81jWo99FBzNLcb/NfEQkZnHVZdDXFKIwcSPltVZO4B+0pHPyZtbyBTSil9KDTRW1Ctm
         g9hg==
X-Gm-Message-State: AOJu0Yxz4hzKD5qIIoeDPEfSXOZGM1nMUKrHDWuPZbSRIhkvkslMu56u
	H5yVpfUTSTvu3bV+I6adCOZUg0URFw2fmX7gbaJWU/i5bi30ud1LkVFUtA==
X-Gm-Gg: ASbGnctU/s/L21pmc8LL55VgXyzR0vTuk6k3DkQW7KSRvRZAyWJBw3dYYWM4Ok0nlJh
	gksiiz5v7sISmENyREYrcjgSSyVhqGbyHE1qP3vXrOcigWiPmYyErbdQp8/nKgkHH7KzDKQ2nbC
	O8oeRVK4A1V1K9XrC2zqd65gf2l+u1byazzxco059AwSsPa6Qb2cECu6XqOSwOq/5Cfu7tbg/kD
	2ivsLXphC+JqFRmzjyIyxHB7FqTHM0TF340BC3aUx6/a5D+0L9euxZovE0zw7nZFlQ3bEdPQUgT
	BrwdqVRrA+hpWjKovqMScQZzRCLqJ1AL55Q2wtmWNkt5MtM/cKNKeC6fa6BRsD2RWIkUh7RL5Zh
	+V85Y4xLgZFc=
X-Google-Smtp-Source: AGHT+IFymEDY6AL9rQDpoa98dl82i7CJCFM+LqD+VzBlStPPB/9t7QuHRp8OLfaEkhhLcTFKbgtdvA==
X-Received: by 2002:a05:6a00:1481:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73bd0e97a1emr19119556b3a.0.1744708608382;
        Tue, 15 Apr 2025 02:16:48 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm8291082b3a.64.2025.04.15.02.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:16:48 -0700 (PDT)
Message-ID: <2e4a719e-67fb-43f9-9473-87a745b63e82@gmail.com>
Date: Tue, 15 Apr 2025 18:13:11 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 2/2] Split "Index of People" from general "Index"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <044918d6-0b23-4e9f-91dc-14219b171548@gmail.com>
 <c770ed91-7a27-4da3-a003-c0607d0f90f0@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c770ed91-7a27-4da3-a003-c0607d0f90f0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For more readable Index pages, move people's names into "Index of
People".

Existing index markers are ready for the split.
Just tweaking their definitions in the preamble and adding
a makeindex command in utilities/runlatex.sh should suffice.

Change titles of Index pages as follows:

    - Index of Terms
    - Index of People
    - Index of APIs

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex       | 17 +++++++++++------
 utilities/runlatex.sh |  3 ++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index e977dfb8..25f16ff0 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -187,8 +187,9 @@
 \usepackage{placeins}
 }
 % Custom commands for index
-\newindex[API Index]{api} % index for API
-\newindex[People Name Index]{ppl} % index for People Name
+\renewcommand{\indexname}{Index of Terms}
+\newindex[Index of APIs]{api} % index for API
+\newindex[Index of People]{ppl} % index for People Name
 \newcommand{\categapi}[1]{~{\scriptsize (#1)}}
 \IfIndexHl{
 \newcommand{\hlindex}[1]{\textcolor{DarkGreen}{#1}}
@@ -294,10 +295,10 @@
 \newcommand{\apialtc}[2]{\hlindex{\co{#1}}\sindex[api]{#2@\co{#2}\categapi{c}}}
 \newcommand{\apialtg}[2]{\hlindex{\co{#1}}\sindex[api]{#2@\co{#2}\categapi{g}}}
 \newcommand{\apialtk}[2]{\hlindex{\co{#1}}\sindex[api]{#2@\co{#2}\categapi{k}}}
-\newcommand{\ppl}[2]{\hlindex{#1 #2}\index{#2, #1}} % forename surname in text, "surname, forename" into ppl index
-\newcommand{\pplmdl}[2]{\hlindex{#1~#2}\index{#2, #1}} % for abbreviated middle name
-\newcommand{\pplsur}[2]{\hlindex{#2}\index{#2, #1}} % surname in text, "surname, givenname" into ppl index
-\newcommand{\pplalt}[2]{\hlindex{#1}\index{#2}} % put 1st arg in text, put 2nd arg into ppl index
+\newcommand{\ppl}[2]{\hlindex{#1 #2}\sindex[ppl]{#2, #1}} % forename surname in text, "surname, forename" into ppl index
+\newcommand{\pplmdl}[2]{\hlindex{#1~#2}\sindex[ppl]{#2, #1}} % for abbreviated middle name
+\newcommand{\pplsur}[2]{\hlindex{#2}\sindex[ppl]{#2, #1}} % surname in text, "surname, givenname" into ppl index
+\newcommand{\pplalt}[2]{\hlindex{#1}\sindex[ppl]{#2}} % put 1st arg in text, put 2nd arg into ppl index
 
 \IfTwoColumn{}{
   \setboolean{colorlinks}{true}
@@ -748,6 +749,10 @@
 }
 \printindex
 \phantomsection
+\setindexprenote{% empty for now
+}
+\printindex[ppl]
+\phantomsection
 \setindexprenote{%
   \hfill\begin{minipage}{2.6in}
     \footnotesize (c):~Cxx standard, (g):~GCC extension,
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index ec2114af..358b6baf 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -69,8 +69,9 @@ iterate_latex () {
 	perl utilities/adjustindexformat.pl $basename.idx > $basename-adjust.idx
 	cp -f $basename-adjust.idx $basename.idx
 	makeindex $basename.idx > /dev/null 2>&1
+	makeindex $basename-ppl.idx > /dev/null 2>&1
 	makeindex $basename-api.idx > /dev/null 2>&1
-	if grep -q '## Warning' $basename.ilg $basename-api.ilg
+	if grep -q '## Warning' $basename.ilg $basename-ppl.ilg $basename-api.ilg
 	then
 		echo "----- Warning in makeindex, see .ilg log files. -----"
 		exit 1
-- 
2.34.1


