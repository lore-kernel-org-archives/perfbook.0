Return-Path: <SRS0=tHCU=DO=gmail.com=junchang2020@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XMRyeMPEiwLsl083fpVgDI8y8LfVuFRxw+VPRvFJUQA=;
        b=CgGFd/MtpF5ablenZ/uRcpnQoPWFGo8WvKPy+V3FginlisoC/OZhfH/EG/E8uxkSwe
         FMqfgENgN78rEc/kfFkoRiiAPyGf+NR02+uEB8EMctN0uj8jG/NfiTX6YbTQHvZ/Iup9
         dUNECY24YPhu5yeq+Ei0NFdWjFJNSYf7/+Jgdt9dTpFtWnh5vqNcEm8WtKY4Gyt2kRIw
         n/2BsjbWyCy95tPwSkmxzw2RqvdcT4Pi63IQEaf3duDndX9oroy61UheqPyoF/7t3V66
         PxzDOV/gS8BYmYn+UsFVv22rFJC/Be6zHXZbi9jlHWANNbf0vqqkUPecmuLLzBgQZZrf
         ziMQ==
Date: Wed, 7 Oct 2020 09:50:35 +0800
From: Junchang Wang <junchang2020@gmail.com>
Subject: Re: [PATCH] api-gcc.h: fix typos in the functions atomic_add_*
Message-ID: <20201007015035.GA7206@HongKong.localdomain>
References: <20200929084006.GA31703@HongKong.localdomain>
 <d634acb5-f4b4-4e76-fecf-91a0ca541e79@gmail.com>
 <20201003042847.GA32682@HongKong.localdomain>
 <20201003161925.GL29330@paulmck-ThinkPad-P72>
 <20201005221222.GA14386@paulmck-ThinkPad-P72>
 <20201006064020.GA22000@HongKong.localdomain>
 <20201006154149.GI29330@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006154149.GI29330@paulmck-ThinkPad-P72>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Oct 06, 2020 at 08:41:49AM -0700, Paul E. McKenney wrote:
>On Tue, Oct 06, 2020 at 02:40:20PM +0800, Junchang Wang wrote:
>> On Mon, Oct 05, 2020 at 03:12:22PM -0700, Paul E. McKenney wrote:
>> >On Sat, Oct 03, 2020 at 09:19:25AM -0700, Paul E. McKenney wrote:
>> >> On Sat, Oct 03, 2020 at 12:28:47PM +0800, Junchang Wang wrote:
>> >
>> >[ . . . ]
>> >
>> >> But sadly, this change does not fix this bug:
>> >> 
>> >> $ ./hash_bkt_hazptr --schroedinger --nreaders 1 --duration 1000 --updatewait 0 --nbuckets 8192 --elems/writer 8192
>> >> Segmentation fault (core dumped)
>> >> 
>> >> Can't have everything.  ;-)
>> >> 
>> >> It appears that hashtorture manages to fail to call the per-thread
>> >> hazard-pointers initialization on some paths, so it is no surprise
>> >> that Junchang's fix doesn't fix this bug.
>> >
>> >							Thanx, Paul
>> >
>> >------------------------------------------------------------------------
>> >
>> >commit 2533decebb7fca65d2860174246966f5ed255dd0
>> >Author: Paul E. McKenney <paulmck@kernel.org>
>> >Date:   Mon Oct 5 15:10:03 2020 -0700
>> >
>> >    datastruct/hash: Add missing hash_register_thread()
>> >    
>> >    The zoo_test() function was missing the hash_register_thread() invocation
>> >    that is required to make hazard pointers work correctly.  The lack
>> >    of this invocation results in a segmentation violation.  This commit
>> >    therefore adds this call.
>> >    
>> >    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>> >
>> 
>> Hi Paul,
>> 
>> This patch fixes the bug, and now "./hash_bkt_hazptr --schroedinger" works
>> correctly on my servers. Thanks a lot.
>
>Thank you for testing!  May I apply your Tested-by?
>

Hi Paul,

I'm very happy that I can help improve perfbook. Please add a

Tested-by: Junchang Wang <junchang2020@gmail.com>


Thanks,
--Junchang


>							Thanx, Paul
>
>> --Junchang
>> 
>> >diff --git a/CodeSamples/datastruct/hash/hashtorture.h b/CodeSamples/datastruct/hash/hashtorture.h
>> >index 6d30cb8..7d43e11 100644
>> >--- a/CodeSamples/datastruct/hash/hashtorture.h
>> >+++ b/CodeSamples/datastruct/hash/hashtorture.h
>> >@@ -1211,6 +1211,7 @@ void zoo_test(void)
>> > 	for (i = 0; i < nupdaters * elperupdater; i++) {
>> > 		sprintf(&zoo_names[ZOO_NAMELEN * i], "a%ld", i);
>> > 	}
>> >+	hash_register_thread();
>> > 
>> > 	zhep = malloc(sizeof(*zhep));
>> > 	BUG_ON(!zhep);
