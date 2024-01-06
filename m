Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C224010E5
	for <perfbook@vger.kernel.org>; Sat,  6 Jan 2024 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTvoPW9c"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bbc7746812so166005b6e.2
        for <perfbook@vger.kernel.org>; Fri, 05 Jan 2024 17:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704503762; x=1705108562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4K/XDkomy+mY0CLwW5eAmPyelKOI9CeM6v/53HuYXQ=;
        b=KTvoPW9cDY6ZCwXFAsf/vVMEaPpoIxsq+Y/biRwIBppEP3iuZXP9UsdZw7eNPltyQU
         SFE7AV21njejb8IHvJc4mm9VH4a7CkZPsvveN0bpvKY31M0u1BQgtX9FYEkin8JOLgv6
         K0axirZLRvInSTQ0kwtDVbgNjcZAglURkNFyusuCjMJgzGEWUsYuxcR2juBEuk2zMWLJ
         F1m/IjeG1A7aUj5zsq4GEwb6qKD4XpN+i1Slrr2E4qQ4C9Ar8s20X/XTQ1rj6dIQm7n3
         NpPmg9NaDHmQtIf8CLsF+EFjitEx7eK8JxtdWZkaECANkRAqNDQfQrHpy0RvckZXdMfJ
         rPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704503762; x=1705108562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4K/XDkomy+mY0CLwW5eAmPyelKOI9CeM6v/53HuYXQ=;
        b=eedRTL+EUJoKzrxOORctgPnA5Rn+fGdfrZcNuGg5o/MNdGep21jm4sswI+8PGB6+FX
         SAM3oRj9+KGCc71eE63BUGWhtdZT5Be2szDCNe2gjDkwRFDkBf7PpkM+xyO80w8nSH++
         8meI0FRQ0jqM4b6bxHUmPoO0LfZwOWXOkaUG88EgJpC0dskugo/KwTblYvzfOWtMIzRO
         AIH0lS+5Rm48seESzPojOtVd4GMB7JYCHp2Qw/N0VyGEuOybC+i8LdhifIEEBhajLKb5
         g9uw7bcr7sSIW73nDO9RuLmsvqwyQx5BVCk/eyh5kN7bkUJPWvCVKxIHRRcgumN8MCXJ
         V+7g==
X-Gm-Message-State: AOJu0YyIuYPXnkOmaH1znNAN1FXBbeqaojE/v4Hao73bPwC52jAPa6tE
	AqTteQTPd/NdAK1mWhKg+cM=
X-Google-Smtp-Source: AGHT+IGKXD6JA5xdk0t97K1ss6fMya1H8CuBHonI9yjuO3NqvON5M5y8Vn5k6M5tWbBifXL7tmVvtg==
X-Received: by 2002:a05:6808:2187:b0:3bc:641f:c7f9 with SMTP id be7-20020a056808218700b003bc641fc7f9mr389869oib.35.1704503761730;
        Fri, 05 Jan 2024 17:16:01 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id w1-20020a170902e88100b001d49e742d51sm1992268plg.30.2024.01.05.17.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 17:16:01 -0800 (PST)
Message-ID: <ae5a1ed4-dd5b-469f-9a6a-b3c7dc475d49@gmail.com>
Date: Sat, 6 Jan 2024 10:15:57 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook 8/8] gitlab-ci.yml: Install librsvg instead of
 inkscape
To: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>
References: <8d0ffcdc-59f9-49ef-b8e1-313e71cac913@gmail.com>
 <07aca12c-85f9-4e8c-b0f6-1e502cdd8cc5@gmail.com>
 <b49648d42bbd646241edbf4b360adb68d7322cb4.camel@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b49648d42bbd646241edbf4b360adb68d7322cb4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Leo,

On Fri, 05 Jan 2024 18:39:15 -0300, Leonardo Brás wrote:
> On Fri, 2024-01-05 at 18:58 +0900, Akira Yokosawa wrote:
>> On Arch Linux, rsvg-convert is provided in the librsvg package.
>> Install it instead of inkscape.
>>
>> Using rsvg-convert can shorten runtime of CI job for building PDFs
>> a bit.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> Cc: Leonardo Bras <leobras.c@gmail.com>
>> ---
> 
> Hello Akira, 
> 
> I used the leobras-ci branch from gitlab/linux_kernel/perfbook to test your
> patchset: 
> https://gitlab.com/linux-kernel/perfbook/-/jobs/5872530547

Thank you for taking the time!

> 
> It generated the pdf successfully, could you check if the images were generated
> correctly?
> https://gitlab.com/linux-kernel/perfbook/-/jobs/5872530547/artifacts/browse

Looks good to me.

> 
>> Needs an explicit ACK or Tested-by from Leo.
>> Expected order of reduction of build time:  ~10s

And the job took 11m53s.
Previous runs: 13m29s, 12m57s, 13m50s, 13m45s, 12m26s ...
Not installing inkscape should also help reduce the time.

>>
>>  utilities/gitlab-ci.yml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
>> index bcda8712..17525fb4 100644
>> --- a/utilities/gitlab-ci.yml
>> +++ b/utilities/gitlab-ci.yml
>> @@ -19,7 +19,7 @@ generate_pdfs:
>>      stage: build
>>  
>>      before_script:
>> -        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
>> +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz librsvg wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
> 
> so s/inkscape/librsvg/ right? 

Yes.

> 
> It's fine by me.

May I take that as your Acked-by: ?

        Thanks, Akira

> 
> Thanks!
> Leo
> 
>>          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
>>  
>>      script:
> 
