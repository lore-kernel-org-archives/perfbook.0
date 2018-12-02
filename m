Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rNtEpoCsKJ7QlWUqtjNkZvoytayqWMP9oQedLMRVgWk=;
        b=io3jjHC13aTP0iHCkmT8jEUgyVAIS69OQG/RRc+JIQywWpjdyLmiIKULSoWkOH5dgs
         Sn6Xanqi9WBjgErAu9Wljyh7VqlS4V3d0hn9ZdaF9DH15ShuyW0c6dCZC7V+zed1fFN4
         XBW1sTJSlG8MvZsEpugqZdsv+39e6vkR61CXPfzDEHQ7NV5W6ryjRdeXQNNrwXJPmyki
         DA+OUOXk4tGqt8cNASQY2vUA0LQtSY6y7U5d1Z7KsblF/WoyvijfLewRfOFAVV68ZGKL
         b7BlZZSq9Sw024MuwcfFW+uRwV7HoBS367JLuOEO+UpU0KGg8HD5uOR4LjiJ+mJxChm5
         m1rw==
Subject: Re: [PATCH v2 1/2] defer: Update Hlist RCU API table
References: <92d5a836-db9d-1333-b2cf-9e2664c7744c@gmail.com>
 <cf4362c2-8070-d547-8f0a-4684faddad8e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9aadcf2c-fd99-aa87-9dd8-1e03459ee651@gmail.com>
Date: Mon, 3 Dec 2018 00:11:20 +0900
MIME-Version: 1.0
In-Reply-To: <cf4362c2-8070-d547-8f0a-4684faddad8e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Paul,

IIUC, your work on RCU API consolidation seems to affect Section 9.5.4,
especially Table 9.3.

I'm not sure, but one idea would be to keep Table 9.3 for future
reference and add a new one representing consolidated set of API.

Just a reminder.

        Thanks, Akira

 

