Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=1P0tn6b54za+IUQywyCJXu3IisI3gTa6u1L1cMeITZM=;
 b=d4WZ0RQihtrt+z0A383V6NDnFFZ+KIP22S3oJyWd+oDgVxk/kg+PgrO+WhQ/rmS/KT
 xr6RE+RdFSPrHhFg+SsIU7GqAMARcTqYUjbmK++eubp04l/L+4j7jeM4HvqLwYQuXDEn
 HnfNYmo4VUmJHrHn2GTSSUR6RMKtftvRFPGsJUvUFN2BH0lIndilXCL17961gcpE0E2Z
 vJW8XZ9Y+PTn/kjQ0nB+9Wq6F222mcCkmgVRqCRS73ik0ZKMoHJoN7tyljz/rSi4nec8
 /h9pUglfL9Afv+G5ZCPdi9weEQYAv4vHfyijldNb3d9/CjC5oUNi/ioY0PrWbA7Uw6kJ
 48Yg==
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
 <571C42A1.8060201@gmail.com> <571C6CBB.4080101@gmail.com>
 <571CD6E7.4060301@gmail.com> <20160424175701.GU3756@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571D4684.2030007@gmail.com>
Date: Mon, 25 Apr 2016 07:19:48 +0900
MIME-Version: 1.0
In-Reply-To: <20160424175701.GU3756@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/24 10:57:01 -0700, Paul E. McKenney wrote:
> On Sun, Apr 24, 2016 at 11:23:35PM +0900, Akira Yokosawa wrote:

[snip]

>> There was no change in the behavior.
> 
> Ah, that would explain the lack of complaints.  Most people reading
> the book on a mobile device use perfbook-1c.pdf, so the chapter
> links would work nicely for them.

Then, wouldn't it be nicer if we change the default target in Makefile
to perfbook-1c.pdf ?

Or how about just adding a shorter name target such as "1c" that would
build perfbook-1c.pdf ?

Of course, we should be careful enough not to annoy people by a
sudden change of behavior.

                                                 Thanks, Akira

> 
>> I'm very glad I can contribute the perfbook project in this manner.
>>
>> So far, patches I submitted were mostly cosmetic changes.
>> I'm planning to submit something that touches the actual contents, too.
>> But don't expect too much.
> 
> Cosmetic it might be, but I believe that readers will appreciate it
> very much!  Thank you again!
> 
> 							Thanx, Paul
> 
> 

