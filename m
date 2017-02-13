Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:35238 "EHLO
 mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751793AbdBMNgp (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 13
 Feb 2017 08:36:45 -0500
Received: by mail-ot0-f194.google.com with SMTP id 65so11335175otq.2 for
 <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 05:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=N3cuOkm1pCkxF5+Rw+ZARipGOARQGwqdfThgr4hJppU=;
 b=YEu6Ev5x4rQQ70ftfmA0q1ZS0iLKKgqGoiHw7o/Q66H2A0D1XML/JsLTi3RxDJc/E7
 yP5WMMQq/ViWSAfUJmcGxYJyYT9ZlX3+NtgKBj35RbVdZaoAlXbbEsZPJnBuDldGl8do
 9hPql2MW/84FLFIU5QyXzyiThtCNkCaIWmsLyM5HrJMtlEbSFPs26zpkaapI0XiP8Rul
 HvAMqEQclO4p7LxDo2dr8sk2bxChRcSXkEgtmUQlgGMClJxkABMdlf6UMv3wYx3hRyoN
 1TRWB7bhdxFMOl6y5lMUBqPcZHZt4ulSaLjH+htCB3iF/WrQd4G44OWIDq01cWaOWToI
 iz5A==
Received: from [192.168.1.106] ([110.64.91.54]) by smtp.gmail.com with ESMTPSA
 id a1sm14982089pgn.51.2017.02.13.05.36.42 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Mon, 13 Feb
 2017 05:36:43 -0800 (PST)
Subject: Re: [Typo] Quick quiz B.13 typo
References: <7b82c257-889e-10bf-b6be-4042cd09aaae@gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <9ab95de8-fade-b685-9030-3031e73b6138@gmail.com>
Date: Mon, 13 Feb 2017 21:36:31 +0800
MIME-Version: 1.0
In-Reply-To: <7b82c257-889e-10bf-b6be-4042cd09aaae@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

On 2017/2/13 21:24, Yubin Ruan wrote:
> perfbook 2017.01.02a:
>
> Quick Quiz B.13:
>     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an
> interrupt handler, and that the CPU 2's line 9 is run
>                                               ~~~~~~~~~
>                                               typo here
>
> regards,
> Yubin Ruan

Sorry for the poor indenting of my email, the typo is actually at "is 
run" at the end of the line.

Also, there is another typo in the answer to this quiz:

    "The assertion will need to written to ensure..."

should be

     "The...will need to be written to ensure..."

regards,
Yubin Ruan
