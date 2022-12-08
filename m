Return-Path: <SRS0=OK5v=4G=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWUyc3xaYwGzwsgwJvWzQCM6V3/Un04XVqUrZfrzsno=;
        b=ZZaVLpA1gDwXJUjyowz4vjMAPRiAEqGOY4KqFnn6hVdBUSwgHsVUTQ2ecI4D9g21UG
         qkpkVXweJUm2Y/V78LWoAH2Wk5GRFt5fSMzGdfB5vW+OFreAU7iboOkm5GXyS2aNrOUv
         QjqkpLMBgkHN9xs+EfVjwtVI5XqGcpxnR97Sfos0zP9xePbuJ74knPQvFek95gqCT6hd
         KHMBuiWb6ThmZkCaIqlUaR5vJ9Ubj+ifbNQTP3mY4u0yqnCHhsYRzYzo1guvrkObqspN
         6gy4kPOyPpdAyg8tiViPiq5Ro0Sp2iEFKAULqrMTso8fb8trE8OyRRkol8bTwz5ymQes
         WRfQ==
Message-ID: <0e6a0bd2-0502-5107-0711-89a9a62e35e5@gmail.com>
Date: Thu, 8 Dec 2022 14:03:04 +0900
MIME-Version: 1.0
Subject: Re: LaTeX package lineno v5.0 doesn't work with perfbook
References: <939b8f77-8d8d-bdc0-0a98-585b88f23481@gmail.com>
 <20221208001726.GL4001@paulmck-ThinkPad-P17-Gen-1>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20221208001726.GL4001@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 7 Dec 2022 16:17:26 -0800, Paul E. McKenney wrote:
> On Thu, Dec 08, 2022 at 08:13:11AM +0900, Akira Yokosawa wrote:
>> Hi all,
>>
>> After updating of lineno to v5.0 released on 2022/12/06,
>> I'm observing fatal error in building perfbook.
>>
>> If you are using vanilla TeX Live 2022, please stay with v4.41
>> (released way back on 2005/11/02!) for the moment.
> 
> Thank you for letting us know!

This issue was already reported at:
     https://github.com/latex-lineno/lineno/issues/5.

As you can see there, I have made a workaround in my perfbook
fork, but am hoping lineno can fix this issue on its own.

        Thanks, Akira

> 
> 							Thanx, Paul
