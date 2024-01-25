Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF9148790
	for <perfbook@vger.kernel.org>; Thu, 25 Jan 2024 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706181325; cv=none; b=TVZ+BWPz34FmjKFRvj/7xo05FDs73EPjteafkH+wFRJnC7FVOlPSISlT2KkmLrYx3C7Z+YmS1BV6/dZYGWGf19X/4zIhtGCfghCxVScIo5ccSaFB7IZ25LhDP0q5YQHd2LnDkJoVtewue8pRVOwbGtjemTizs9idUcqCkFL3VQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706181325; c=relaxed/simple;
	bh=rzKBWyYE8Xqo/Eg3HLS5izrvQOH+HLUTji+w32ny2q0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=keFg2HeORC1EUupWI4PIaTCBtrlX5MbOMysT/0cLRln6iB1nKLogH2ph4LBCIQwKmuXpSs++3vlkh3TSCXiDWieYafqHHYbxxoua+ciLIGGTd4pDw0vctZCxHvTXdClVUCnBEfC43WDr3THDycdmbp7nZyFWLeHVXFJ/EoO/0vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzdU57H5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzdU57H5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d71e1d7c78so40041265ad.3
        for <perfbook@vger.kernel.org>; Thu, 25 Jan 2024 03:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706181323; x=1706786123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ReakDxlw+5yYYmxWXt2pU8WYCQZm2+xrhfyCiL2BnP8=;
        b=SzdU57H5xjSyS63+sUvUG2BqvvCMJe0m0GfrWZZtsSMwAFB/C3vidtMMJsCcVArE0y
         XKHYL6ACFnPOMVzDqoW6vb8m+na47nAcuZKdsk6lEDL1ZR/31zJ/Hysjpkh3G+CjVh6H
         BFWx8nLdkDMw+7hRh7aj8vOoXtg780IaRgfwPUfeEc2ySzEPzhWYgNvHtqevO09o9ITB
         iHs0zevdIL26bQI7sQ5psf3UYKzf+jpCM/HgjES0RtT+GzQVBUuoB1hGvAub++ypCa4U
         PvgXJ2Oau3ZaPtiMJt2hP9+r+wkI13kOSGrZX2eB9y8KL9+2U5seHc3g7gXLSXdr3EUv
         zUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706181323; x=1706786123;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReakDxlw+5yYYmxWXt2pU8WYCQZm2+xrhfyCiL2BnP8=;
        b=ez/99q4aOwL45QwUKzdF1GOWpWcXr4fbJ04i62Xx0R4cS1OnjyGtJfK8/4tJh+XHan
         0tpX2Azjjhenkwaw7BoBVXmKZJv9sOzN8fvIQilbWon35KTPcVmo7cU1zj1YRM7xkwWH
         b2xhOPdy1nI1lwgNf1kTccX/qT+WYJ0ZshaU49Q1NmyYD/M8migQ4945gW7D0ytDeu//
         nwVhljhPkuaztgkPvrzBX1k98MxzrylXe5Exfz8yDtgXSvVoImHKLwOEMDNI3b/LEZ7i
         7adN0/ZPBvxkxrVuiSSewaJMeeRImGnuPNPRN7/brd0dGGA8+m261PvQec3cYkv0boAL
         wiVQ==
X-Gm-Message-State: AOJu0YwLXbQnnSzUZhodcZaC8ucAwaEdXI43tThKCKXuu/zuT+IjgC5r
	NtUj+sq1VNivm4GlxnK7CAve5B/VyrHYc6pzydfapnonfXbKK3s8
X-Google-Smtp-Source: AGHT+IFCX5zwL+14Skz3Iw6CSTRd/4itbPijGRakw3zOJ55BnnJZ8Q1AdHpa00qN0epz677sUpAm2A==
X-Received: by 2002:a17:902:c94e:b0:1d8:90c8:9ae8 with SMTP id i14-20020a170902c94e00b001d890c89ae8mr276627pla.89.1706181323087;
        Thu, 25 Jan 2024 03:15:23 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001d5e340d979sm11838932plw.6.2024.01.25.03.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 03:15:22 -0800 (PST)
Message-ID: <b083ef95-a20d-4e77-a0cc-63c26a4a3ad5@gmail.com>
Date: Thu, 25 Jan 2024 20:15:22 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH -perfbook] memorder: Tweak size of figures in Answer to
 QQz on x86 memory ordering
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <4c252203-5802-4183-af41-f6a311663df7@gmail.com>
 <6cefb50a-4240-4e79-b038-4cdbaddb3702@paulmck-laptop>
Content-Language: en-US
In-Reply-To: <6cefb50a-4240-4e79-b038-4cdbaddb3702@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/01/24 1:51, Paul E. McKenney wrote:
> On Tue, Jan 23, 2024 at 11:58:24PM +0900, Akira Yokosawa wrote:
>> The use \columnwidth results in too large figures in -1c and -eb
>> builds.  Instead, use \twocolumwidth (\columnwidth of 2c build) and
>> make them more or less similarly scaled.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Queued, thank you!  And at some point, I should learn that \twocolumnwidth
> is *not* the width of both columns.  ;-)

That would be \twocolumntextwidth.

Yes, those namings (by me) are confusing.

How about calling \twocolumnwidth as \columnwidthofTwoCol,
\onecolumntextwidth as \textwidthofOneCol, and
\twocolumntextwidth as \textwidthofTwoCol ?

I'd love to use "1c" and "2c" in these names, but numbers are
not allowed in command names of LaTeX.

        Thanks, Akira
