Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1CB221FCD
	for <perfbook@vger.kernel.org>; Sat, 27 Jun 2026 05:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782537977; cv=none; b=MmUvAB82E/GD5Kks1bpUoWqP89hTqk06RgVMAY+Je0hNKagcG0w6+uTzcUrWeWnQc1sUtCc3LIeJeCb/ZTlmEJ0trDQxDrXB7wGoGUc4ct0U2gdjkeklM0Uu62xy5oUMgAqlWlNeoXGaWkGRL63KCCcv9dQJT3wBJ479KZ79suw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782537977; c=relaxed/simple;
	bh=jKBOwZAbVDqmwnwx961O8ix/8zO1Pt4T57vcMRpFje0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GKH6l8S8XnRcQyb7dFMmy1zxCxVF6ciKFSqCkDmvtpeexyIZ6xCy05iNcBYRhjBCxKDlTisbP3Pj4mJA/IFWO+BAQSI+aNYbtu08CD64OpJND3gWSQjmTEMtMNHkKo+M+mV/BAwLucHWsVCY5VYwwxOtk44euN+ho5lUg4KTG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzJvHUFw; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzJvHUFw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c7ebfb63c6so11456235ad.3
        for <perfbook@vger.kernel.org>; Fri, 26 Jun 2026 22:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782537975; x=1783142775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHCciXu5Dnvpvj9zKCUlWiApH4DJegXa/vnd8UZrUBk=;
        b=fzJvHUFwx/RbbqOUTfdm00j9xXx8o3cK7+raMe7Qx3kC6xuNLjAhYWpJTXlaSTaRFJ
         5jJfvpQmHicYocZ/b4PYyUkBpyKH5JrrrNxizw7ThvGm8DwExKpXAdv1mnyvd2uxLq/o
         FVbljNlp2cDA8UYJn1UdukikGaXrdLKZGwuAW5G403SLR07ZaHkny02hshl/uQ8pKIDf
         fXkEm3ZaDM1+28AXBA2nUU5ZPktflwZSNvVyzFWm75rul7fmWFvEAGcsb27r6iSJetcG
         csRNgQc8pNoDHTsT5YeeBic828Iymlpn+Bl+hw0VAYL1s2K/kErp1anf2A9Pot6VPd7L
         zLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782537975; x=1783142775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHCciXu5Dnvpvj9zKCUlWiApH4DJegXa/vnd8UZrUBk=;
        b=s4BdoiXpIbda8f2udq/pplkV3EKq5EaWfMy+kuNAjVA5ueWVY4kgDWMhE3+0JNqHGJ
         gKuuRt9jaWlMPkjjqdiDXA7AxbGq07HAdVXT7Rns2/bVnhcOO954DQqCJzGfcKgt19G0
         lpN37xpFFG45pqOxeivxODw0Z5Vjdb0jy3CqBG69uWMyx3gdmjZeKMMpU9eJX8sIB9GY
         XLo9oxzfDUrVx2mujLvcxpFBE3vLPRkcY8yUAU1GrR2Gi8fR6DVNwEYZU5uY0gDR3bEJ
         NpqZ/DiMCFjn+23j3+Yy8zeFD5DosWuEyaCYoIPXn9HrWdxxU68dufA3esHU19NYRYa8
         8nXA==
X-Gm-Message-State: AOJu0YxP204e0MA07mgxttE+Y9V9nB+IqoTcy8s5GizB89EmCFeSZBbQ
	n1a1x9OTuwV4FmbRkMONH+HWslsjeWNNW4JKqCQ/LPfHUj6NDRrBITGe
X-Gm-Gg: AfdE7cmlyItEGOj5I3HG8QfmSAq596DDIGH+UooKTio+ZX8q7boMR4HG5bXW+MeU4wX
	8PwcPNwdBrh9io6O4TZgvqPuqp1viuKKZ+5DSN63y8+K8QLPpoVbwxiqe/1vEBpapPN2+fRJkvW
	WyJjwffj9GPnymv3GZ+6ldKB1kW6KvRKxz2vLEY+QhPHSL2k667LSS7n7q1DhmotSRihf36tB3S
	oitKta/u38P6hz1YWMYZaEpb9jA3uL0m4g8LRGyHgZ7GfpcegXN9ildAaMtgYvL25t/MHRdImRn
	lb2n3hjveIsj1wYpW26uBqkC2BqnDXBOIpdBnVg/SLeeAizy10iC8gbNj8VVzCykRRGtp/Qc2he
	nnKwwe5JA+QJRRpGuoOFJyybC4MDJz4ar5d6RxsRAwMBFVfevDoKQcnLQXeFn/aJnlycOUYog79
	z51+3MlKkY0sBgud/GojaO94Zh0/rMiPnHJyi1oC3nEzYgY1+r+b4q79Td4g==
X-Received: by 2002:a17:902:d488:b0:2c6:8e82:977c with SMTP id d9443c01a7336-2c7fc8a171dmr86953695ad.15.1782537975459;
        Fri, 26 Jun 2026 22:26:15 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c9b1b02f8esm4637945ad.71.2026.06.26.22.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 22:26:15 -0700 (PDT)
Message-ID: <ae86dd51-8b93-43c3-a5d6-edc9fc4ce6f6@gmail.com>
Date: Sat, 27 Jun 2026 14:26:14 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook 1/2] Define macros for multi-part listings in
 preamble
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <14878d1b-2d34-417e-a7c8-fe74c6aee08b@gmail.com>
 <1751fd6b-2c9c-43d3-a4eb-f12513f69cbc@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <1751fd6b-2c9c-43d3-a4eb-f12513f69cbc@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, 26 Jun 2026 10:59:03 -0700, Paul E. McKenney wrote:
> On Fri, Jun 26, 2026 at 08:34:47PM +0900, Akira Yokosawa wrote:
>> Paul said he has a plan to add listings similar to Listings 9.13
>> and 9.14 [1].
>>
>> Move local definitions in rcuintro.tex for such multi-part listings
>> into preamble so that they can be used elsewhere.  Note that
>> "VerbatimT" and "adjustwidth" envs have vertical spacing tweaks
>> applied.
> 
> Queued, thank you very much!!!
> 
> I queued the following commit on top of these two in order to create
> the first Tools of the Trade triple listing.  Does this make sense,
> or is there a better way?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 72f863e04bf56ec4e95e90a789570a2434caf61e
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Fri Jun 26 10:44:49 2026 -0700
> 
>     Add definitions of \adjvspace{above,below,bottom}

I removed those definitions in Patch 1/2 because (new) VerbatimT and
adjustwidth envs now have those extra vertical spaces on their own.

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 0dc05325..cb8299a5 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -397,6 +397,12 @@
 {numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,frame=single}
 \DefineVerbatimEnvironment{VerbatimU}{Verbatim}%
 {numbers=none,xleftmargin=5pt,xrightmargin=5pt,samepage=true,frame=single}
+% for multi-part listings with explanation
+\DefineVerbatimEnvironment{VerbatimT}{Verbatim}%
+{numbers=left,numbersep=5pt,frame=single,xrightmargin=5pt}
+\BeforeBeginEnvironment{VerbatimT}{\vspace*{2pt}}
+\AfterEndEnvironment{VerbatimT}{\vspace*{-1pt}}
+\AfterEndEnvironment{adjustwidth}{\vspace*{-2pt}}
 
 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}

>     
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index f6d6efc2..3c1e15f1 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -407,6 +407,9 @@
>  \newcommand{\myfvline}{\arabic{FancyVerbLine}} % redefine on-the-fly
>  \AtBeginEnvironment{VerbatimT}{%
>    \renewcommand{\theFancyVerbLine}{\rmfamily\tiny \myfvline}}
> +\newcommand{\adjvspaceabove}{\vspace*{2pt}}
> +\newcommand{\adjvspacebelow}{\vspace*{-1pt}}
> +\newcommand{\adjvspacebottom}{\vspace*{-2pt}}
>  
>  \IfLmttForCode{
>  \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}

I think the easiest way forward for both of us is to keep your
change without applying my changes.  I'll rebase my changes after
seeing your new multi-part listing(s) and submit v2.

        Thanks, Akira

