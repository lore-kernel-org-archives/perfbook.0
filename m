Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8407F7F8
	for <perfbook@vger.kernel.org>; Tue, 30 Jan 2024 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706628672; cv=none; b=g9dVoZiLzgRnAbeSrY6DE2SW5oaoYKZa8Xg1/vz6JEWVc/TQ7VTP77pdpPwV8ucBrg3+OSB8xB1WuuWbUJc3B52/eTOrFdNbKrCrzLAJkXOZnKmki2HJBhuB17hMyJeOzshhPNqhafdsdkWPhdIb1u4eIP/HI4KUiryPa7CJBhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706628672; c=relaxed/simple;
	bh=ZtvP61LTi4+DO1wCII1Rb5B11sLYSbEBs679wojr4JQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=HVxfWAF+No0/y/nw8u9JL0Oqx9TJaOIdjeovjXKVNgf58VCfemn86zHM5esebkv5uO4n8/OdwsZiVCVNf3vtRXd+JU9BFz8U0Es4hYj0cWPbhXPtGd853/BAYcTYlsvbHN8dr63qA2SkSlzpzGd5bV+rVeLxg2WtoxxW8cSG6F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J60J1QUV; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J60J1QUV"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d7005ea1d0so2614182a12.1
        for <perfbook@vger.kernel.org>; Tue, 30 Jan 2024 07:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706628670; x=1707233470; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42h29nTgEehnpNywg0ygkq+gOuxWST3FNnwYf+TPjUY=;
        b=J60J1QUVePeii8rW9VKlMnRDRw0w9fmJtJUD3FxaKmjzqlM16pIcjTqb3kUu5xO3Zx
         sKcekkBqTOej548vqTnXIM1hCEi+RgzxCLoKjbJ6XqnT24VnvgASQ30iECBYiW+W73pZ
         4ggGORl8insA/Km78xeMSKYysl6yhdTezu31tOSERNQOQDJyrHR3tV60GyVM0zXnbMOg
         JUak4+quFSwqspbuaUp7ZGV5mE0mx5G/uzyrBvJs++BHzm8+3oTEenw33Xo6sNVKwHRZ
         0tZIXoVeuu3FU7BIjYEF4aMW22poszfcygVpawY3HNaZg8jymaVKs/6mjyT4hB61Y8K2
         Ap6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706628670; x=1707233470;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42h29nTgEehnpNywg0ygkq+gOuxWST3FNnwYf+TPjUY=;
        b=jpb5BhGJC5m48UwnWeEdInJE0CuBnT7pJCBeCg/810FHnEWBYgMptFa46XG5AeasI0
         rI3PHjmiWPTlubGhvX0+JFg3gpA9QWLAEg7kJmnZjJTOAjpXH1zuo4lKmBdc3aBVCF8x
         MLBNV8gU81n+1QP0WWrv2Raprnc9u85F3WCi+ETuMBO9SOHROSVnwiHBrxeRY8k4dUpr
         MRxsM6qMHvGe9R7X7ERjbUMw1JTzJXRfCxuEQcC6a6ry+SgvoXeBbdQvCE2BoB55FM8I
         UWvK86T+G+hoXQQhI0fC+Sz//oK3t9GNj/zpPWQoowEoyzvGwU6oEAQtthVPdD7e27r4
         zgLQ==
X-Gm-Message-State: AOJu0Yw+2oi1zybWdbHYEEh9qi1Q85GZnAbQIgS7cYo4SjS+cdrpuwE2
	lkzH5WchUZDN7DypXx3sRKnjtVHUXRMHzTCgIt2nIV2CtbBYXLJB
X-Google-Smtp-Source: AGHT+IHv8Zsc+63b51MDihA3aHHUvfMpgG464lgIn3qdAllpiOELuBmau0d05tQbagw7GMCVfG4WYQ==
X-Received: by 2002:a05:6a20:f82:b0:19c:b1f1:6140 with SMTP id ga2-20020a056a200f8200b0019cb1f16140mr1667178pzb.11.1706628670093;
        Tue, 30 Jan 2024 07:31:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWFnZ8pyU49AfEDN2EYoPfUn/GcXDoAp4ty2Ytv64YGNoXL+HXFXByX3sBa31ZwI0icCxTPKDlKgJqb/Tg3C9mB
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id j2-20020a635942000000b005d5445349edsm8291381pgm.19.2024.01.30.07.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 07:31:09 -0800 (PST)
Message-ID: <903d71c1-b92c-49a9-8365-a931fcaf2514@gmail.com>
Date: Wed, 31 Jan 2024 00:31:06 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFT PATCH -perfbook 0/2] Retouch plots in QQA 15.31
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Paul,

I'm not sure if you are already working on those figures in .png,
but I'm sending updates in scripts.  I'm dropping changes and
additions of .eps and .png files generated by the updated scripts.

Here is a list of commands you'd need to reflect the changes in
perfbook.pdf.

    pushd CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/
    sh plots.sh

    evince coe-nvalue.eps &
    evince coe.eps &
    evince fre.eps &
    evince rfe.eps &
    display fre.png &

If those plots look reasonable to you, please copy them to the parent
directory and do the "make":

    cp *.eps fre.png ../
    popd
    make

If those figures in the resulting perfbook.pdf looks good to you,
I'd like you to go forward and commit the changes and additions:

    git add CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/*.eps
    git add CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/fre.png
    git add CodeSamples/cpu/data/*.eps
    git add CodeSamples/cpu/data/fre.png

    git commit -a # with a suitable tag such as Requested-by: me

Furthermore, if you think those .png figures, now obsoleted by the
new .eps figures, are not needed anymore, please "git rm" them as well.
    
If there is anything I've missed, please let me know.

        Thanks, Akira
--
Akira Yokosawa (2):
  CodeSamples/cpu/data: plots.sh: Fix typo in xlabel for fre plot
  CodeSamples/cpu/data: Use "smooth frequency" for plotting histogram

 .../expand.pl                                 | 42 +++++++++
 .../plots.sh                                  | 85 ++++++++++++++++++-
 2 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100755 CodeSamples/cpu/data/kerneltest009.05.atn6.2024.01.17-08.25.02/expand.pl


base-commit: 9caac64bfabf85439c480ce928dddef969354369
-- 
2.34.1

