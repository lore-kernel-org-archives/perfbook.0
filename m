Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=MmSF90LdJ28S5FTiNKz1tXHXGIi0Ctglmcgo5vIBc/A=;
 b=YBDs9/VdBiqEl6MjN72w4/xn3hWKYKZEOh6rClRNYbUdpdcmH/OULVK8uDC0qgXTdS
 5N/OVZf6YoOnbWwXSjmwdNF5LNxQFq4uiA8Kiifdwy2PM3TZj+Yctd2UpdTXe8MLXuyV
 /jfb25VF8AkZzWeDe9ywfMbEfu0CTr0gnZnsKRLTwFQCeYBjPvQTnDmprlnguhIxWI5o
 8+b+NWTxD3gb5HRAuxfCC1yfn7CBGKJkvxDN2QIVnpvWBhPasqEBkWNSICkiUk35B/6C
 S4rxCQpDbbXgIKY/8AgU1nLZKrpx9JmYjXJrpjozq+UI6NFRembi98n8wVy5aMe6WsRF
 +7AQ==
Subject: Re: Memory barrier -- fix sample code
References: <1470097946.3000.3.camel@gmail.com>
 <20160802040204.GY3482@linux.vnet.ibm.com>
 <1470125114.3000.7.camel@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8a09ce4e-0ed6-bf0e-8941-f7c539b0f6f4@gmail.com>
Date: Tue, 2 Aug 2016 21:09:03 +0900
MIME-Version: 1.0
In-Reply-To: <1470125114.3000.7.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>
Cc: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2016/08/02 18:05:14 +1000, Balbir Singh wrote:
> On Mon, 2016-08-01 at 21:02 -0700, Paul E. McKenney wrote:
>> On Tue, Aug 02, 2016 at 10:32:26AM +1000, Balbir Singh wrote:
>>>  
>>> From: Balbir singh <bsingharora@gmail.com>
>>> Date: Tue, 2 Aug 2016 10:26:34 +1000
>>> Subject: [PATCH] Correct a sample in memorybarriers.tex
>>>  
>>> We probably don't want to show GFP_KERNEL allocation
>>> under spin_lock, GFP_ATOMIC seems much better.
>>>  
>>> Signed-off-by: Balbir singh <bsingharora@gmail.com>
>> Good catch, applied, thank you!
>>  
>> However, I had to apply this by hand due to some recent mass changes to
>> figures containing code.  Could you please move to current perfbook.git
>> for future submissions?
>>  
>>  							Thanx, Paul
> 
> I thought I did a git pull before patching.
> 
> My git-head pointed to 413b7bc1cf6d65368300e96016ac15ac728b66fd
> 
> I'll double check. Thanks for applying it by hand
> 

Hi,

Seems like a problem of character encoding.

I see you are using Evolution.
Here is an excerpt from Linux's Documentation/email-clients.txt.

----
Evolution (GUI)

Some people use this successfully for patches.

When composing mail select: Preformat
  from Format->Paragraph Style->Preformatted (Ctrl-7)
  or the toolbar

Then use:
  Insert->Text File... (Alt-n x)
to insert the patch.

You can also "diff -Nru old.c new.c | xclip", select Preformat, then
paste with the middle button.

----

I hope this helps.

                                   Thanks, Akira

> Balbir Singh.
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

