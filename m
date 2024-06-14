Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63877262BE
	for <perfbook@vger.kernel.org>; Fri, 14 Jun 2024 03:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718336767; cv=none; b=JbiMHsxaZCuo7EXMyuJJZu8ZD3FhZcTCkvHm0KL4/ljjV6IO9BBC0NIAm1va5yWgn3ckXS+d4DmrhXhzOPvxeUceVPUlc2wxBU8RFznxKtKIx3XW2cT6/ckro2iqEiWRh08Ga383S3/XYQQQOa8Nhsf6GcVXdee2elho7HyIsiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718336767; c=relaxed/simple;
	bh=PrKjLKLmUnpnLZ0l/VZI9wJETqZ7KBeylEN7Tc8RLbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxhFS2Jlqwh+iCTXwEZ0C45hmH15wdWLMiaPkv7cYox/zg3CZEXnuyD/moV2xyW42LTV4+/zneGrQIjsZucelFciZjRGtpfDObNIB6ilCS470X4n6+/Yi5x+xEAsDK+PY1qQ47ipR/pqYYafG2rrB/0V3Rv4OI8kCs+NObfGpkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBa3XnHh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBa3XnHh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f480624d0dso14314435ad.1
        for <perfbook@vger.kernel.org>; Thu, 13 Jun 2024 20:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718336765; x=1718941565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCFEImrTkNP0BXNwnotbplWa6LaBFNtOABadNQYfz34=;
        b=SBa3XnHhLEGVmo0H9sbOOoP2orvUPX/NaAnR2bQCDotAWZDFkQsDJf5/wuNy6BTsLJ
         TlIilqkTzR5nafvnzbHG1QsP09dWF7hajRLX/32akyy1l9HWS9c88ZjkgwRH6nLNvqb0
         dAnmL8vrvjxILPCl4fn1sy/iOcH7RaiaHTBcuNU30eg1kvui3tFRpyyGKsnEkiIFZEDP
         YdmU/R61vHiXj2ismxI6TnT7XKCPYIix1d6TCrBkI4kdUFYbYAtcohYOVV6p+qhB9A3e
         5xrCOkmpQw/CYEAo8B3BepW3JJyVFk7GgO4i93kCWMtrqPoCA0YrquGY2aKr76CxNSO0
         L3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718336765; x=1718941565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCFEImrTkNP0BXNwnotbplWa6LaBFNtOABadNQYfz34=;
        b=KfKYuXI/qj2gFtuc3+hqv8ESaaOejET77XoO333GpLBt5QWomIzFxelECl5Qq4xxJI
         D5OuxRIxqROlNjXMB/D4VVR3asXHWLAZE1v+GkaOJiC1E1QdlZBbpbPF5RkKVVxB4PXR
         sxqboINcmwhVnDdn1pb3vpH/lfUGGGaRbzoCOQBfkUathX7jd5EoTybyz30ReT2g/lnz
         mYgWfD2WmjFlC20chvrEu7LwV8An8+RSQMtvC1VBoncAe6JRN563N32OyIxFbc+gmxYU
         GE0JRH3IdIRUWQkEe9b+jE+dh+/tKnoRN7BXCOSnNSlva9ZFnVsXHf2wKI+ExR/4dSXq
         /vGQ==
X-Gm-Message-State: AOJu0YyrHD1w172Hw1++jEgGwsQe+oVmLCZMukRfptfxx4ReWgm1898N
	OYAV4RdInv90iKCcHfnuZnLq2qgQD9mOu9KocK81vTUkv6v2AGrt
X-Google-Smtp-Source: AGHT+IFFkVIcIn1/T4jU3AnM/CriDrub5AjJNWbvdaSDBAmk+hCmE4CMPkydifZmArY524qnBM96Ew==
X-Received: by 2002:a17:902:c944:b0:1f6:92f1:b01c with SMTP id d9443c01a7336-1f862a0cf64mr22919375ad.69.1718336765481;
        Thu, 13 Jun 2024 20:46:05 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e72483sm22172485ad.96.2024.06.13.20.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 20:46:05 -0700 (PDT)
Message-ID: <5456014b-d89b-4022-b969-17021c7acf9c@gmail.com>
Date: Fri, 14 Jun 2024 12:46:03 +0900
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
 <0bed2ebf-ebf6-43fe-8a67-52d9c33cb422@gmail.com>
 <623ce21b-9898-408f-955f-0b35a9504307@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <623ce21b-9898-408f-955f-0b35a9504307@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, 13 Jun 2024 20:33:29 -0700, Paul E. McKenney wrote:
> On Fri, Jun 14, 2024 at 11:12:27AM +0900, Akira Yokosawa wrote:
[...]
>>
>> Good news.
>>
>> I've got parnotes v3c in today's update of vanilla TeX Live 2024.
>> It fixes that "harmless" warning.  Frank is kind enough and takes care of
>> parnotes as a temporary caretaker [1].
> 
> Very good, thank you!
> 
>> Can you please drop 2/3 unless it is too late?
>>
>> [1]: https://mirrors.ctan.org/macros/latex/contrib/parnotes/README.md
> 
> Given that I forgot to push your series out, no problem at all!
> 
> Please let me know if what is pushed now is what you expected.

LGTM!

        Thanks, Akira

> 
> 						Thanx, Paul

