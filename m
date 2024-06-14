Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD937138495
	for <perfbook@vger.kernel.org>; Fri, 14 Jun 2024 02:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718331153; cv=none; b=aB93eV+Fk/lF77BuNEVMeCbbdpIoQFlll2bVcbEvx3liohPwLEa4xymOgx229cx0EyjHtreN62wzB/pKecquxTQgkRnIZmpZbE/eIeVJABDBTIGQ4V58KyjxlaopL1uslPNwgvhMRJcdyXr7/1vEDXtVGUEnXkx28TnysUXYAXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718331153; c=relaxed/simple;
	bh=WUKpu4qBJoS1ZftgdERw7cWa/HHTvu69rUKnQKOs5gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q07IXIYhIHtO9PGFWQ7xbClSW83Y9ongjGfLgmt29Qyn9KBCS+M4DO1YdqZBk5M+LlzmwAYspf7UTyaZezC2JFtSlTZuAE7pJTtFoT/x/AOrWMYiiIOReUgOfif53T+r6AAbJCeF1N+1vJeW+75uplY6YxI6z1VOZW87oEnjEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liM4C5h3; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liM4C5h3"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3737dc4a669so8092225ab.0
        for <perfbook@vger.kernel.org>; Thu, 13 Jun 2024 19:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718331150; x=1718935950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JhDYo6m4xuNlPUw+ZWQFEAkdiH26JbR8IJoj1NUB8ms=;
        b=liM4C5h3dUcQ1/rLXecoD6voxE4sjtCe487TqNwx68HV8KsinsFSGOCrpuAMemY16h
         gs2MMfBJ7aaDksBV1fLPD36Kvo3lpbWPqQ3dQRB6+5sIvCLLJuqxkZAmlK0RnYJriNPF
         bbj50/UIqjWClO680H0Wm3Gs/ZV64iWbyTPZmtZFy79A11NXAp96hnxCYQ00+w/1O4GM
         HKr9h1WeJ51J1HammmBkzSKX/bMO5lWyZmGfThR9jEUv3W2ILmOlgxWPDdIuPcdsccaj
         RgudGwWfpqSpozTMYT+JAFF6u8ryfznYjo3QFn9yVDr7rQ6wiZG9XLqS+xtVCM2LpVlA
         UEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718331150; x=1718935950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhDYo6m4xuNlPUw+ZWQFEAkdiH26JbR8IJoj1NUB8ms=;
        b=pK2cjcSiphKIVc2yQniTT01NbfsIRocmvgVcj6vmRDdoBLCgYgQAIHiifK5+bSFUeK
         g4sw/XsKXd0F1Bu1q7YUzEiwl8UoxpTwfABybQbnk2TvaMnsvSG0sqiJ/t88nC5QUFNZ
         OGyXdy9ZsPhRJemVAobUTYewaR8vO4F2Lj1dYkSAUskq9vAjlP1pcekKXvTp9kkYGtAJ
         pEEy/G1MJSfsKrfl4wUTLW1DPecD2d5OENHVex3JHqfWlHb/YOVnYuhEOovQ+YE48HsD
         JC6zMTmhmofxaMiwwAePKTFSvHC+66a3RsF8DpLuk8+dPgXkRwPkOixXjcNN3o9yNeLN
         IkRg==
X-Gm-Message-State: AOJu0YzusJPycC9TyX1fRRCKZqg74hjYWBzkUw+SdhhW550gGMHkvn0n
	b878EmWjnsBGAy7D1dniH4ayuLPSo7o+QkwIYRq+tNeerA0Q7SjnQEgD7A==
X-Google-Smtp-Source: AGHT+IGAqf8OcaKmBRjFG7oJnKwWT4fKkKUs/mRbABD8QFEsbXghz7/kq8zwVMHlSxWwWrWnOhlSqg==
X-Received: by 2002:a05:6e02:1a2c:b0:374:70ed:d765 with SMTP id e9e14a558f8ab-375e0df9126mr14523385ab.3.1718331150191;
        Thu, 13 Jun 2024 19:12:30 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee2d366e0sm1769865a12.75.2024.06.13.19.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 19:12:29 -0700 (PDT)
Message-ID: <0bed2ebf-ebf6-43fe-8a67-52d9c33cb422@gmail.com>
Date: Fri, 14 Jun 2024 11:12:27 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook v2 0/3] Work around backward incompatible
 changes in LaTeX2e 2024-06-01
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5c81ae1b-ddf5-402e-a5b4-0e332a753c87@gmail.com>
 <c461a45b-2722-4412-8bfa-a987613ad182@paulmck-laptop>
 <c342046b-e078-4447-92ef-d692dce09fad@gmail.com>
 <b538307f-dc77-4015-931c-a3ffed159acf@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b538307f-dc77-4015-931c-a3ffed159acf@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, 12 Jun 2024 16:04:36 -0700, Paul E. McKenney wrote:
> On Thu, Jun 13, 2024 at 08:01:44AM +0900, Akira Yokosawa wrote:
>> On Tue, 11 Jun 2024 05:55:13 -0700, Paul E. McKenney wrote:
>>> On Tue, Jun 11, 2024 at 06:34:25PM +0900, Akira Yokosawa wrote:
>>>> Hi Paul,
>>>>
>>>> As I mentioned earlier [1], recent updates in core LaTeX and accompanying
>>>> changes in the array package broke build of perfbook.
>>>>
>>>> There are two modes of incompatibilities.
>>>>
>>>>   1. arydshln assumes array's internal implementation of a past version of
>>>>      array, which is no longer true with array >=v2.6.
>>>>
>>>>   2. A "LaTeX Warning:" message in loading parnotes.sty.
>>>>
>>>> Neither arydshln nor parnotes is actively maintained, so here are
>>>> workarounds made in perfbook-lt.tex.
>>>>
>>>> Patch 1/3 adds a rollback option to array and sticks with array v2.5 or
>>>> earlier.
>>>>
>>>> Patch 2/3 enables a silence filter for the particular warning.
>>>>
>>>> Patch 3/3 is a follow up change to use date as rollback options of
>>>> glossaries related packages.  By saying [=2022-10-01] rather than
>>>> [=v2.07], [=v4.49], etc., it becomes obvious when those packages worked
>>>> well with our custom code for glossaries & indexing.
>>>>
>>>> [1]: https://lore.kernel.org/r/a3ff0522-fd2d-4c87-9c7b-00cbdd5f3c68@gmail.com/
>>>
>>> Queued, thank you!
>>>
>>> I have to ask...  Longer term, are we going to need to be thinking in
>>> terms of avoiding use of these two packages?  (I have no idea whether
>>> that even makes any sense, but again, I have to ask.)
>>
>> Well, I have faint hope that Frank Mittelbach, the author of
>> TLC3 (The LaTeX Companion, 3rd edition) and the maintainer of array
>> (among others), might want to update those packages, as the book uses
>> arydshln and parnotes in a couple of examples.
>>
>> Just hoping. ;-)
> 
> Me too!  ;-)

Good news.

I've got parnotes v3c in today's update of vanilla TeX Live 2024.
It fixes that "harmless" warning.  Frank is kind enough and takes care of
parnotes as a temporary caretaker [1].

Can you please drop 2/3 unless it is too late?

[1]: https://mirrors.ctan.org/macros/latex/contrib/parnotes/README.md

        Thanks, Akira

> 
> 							Thanx, Paul

