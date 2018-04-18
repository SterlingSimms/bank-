class Bank_account
    attr_accessor :checking
    attr_accessor :savings
    attr_accessor :total
    @@accounts = 0
    def initialize
        @interest_rate = 0.01
        @checking = 0
        @savings = 0
        @total = 0
        @@accounts += 1
    end
    def checking_balance
        p @checking
        self
    end
    def savings_balance
        p @savings
        self
    end
    def deposit(money)
        @checking += money[:checking] if money && money[:checking]
        @savings += money[:savings] if money && money[:savings]
        total_balance
        self
    end
    def withdraw(money)
        @checking -= money[:checking] if money && money[:checking] && funds = money[:checking] <= @checking
        puts "There are insufficient funds in your checking account" if !funds
        @savings -= money[:savings] if money && money[:savings] && funds = money[:savings] <= @savings
        puts "There are insufficient funds in your savings account" if !funds
        total_balance
        self
    end
    def total_balance
        @total = @checking + @savings
        self
    end
    def account_info
            user_info = personal_info
        puts " Account: #{user_info}\n Balance: $#{self.total}\n Checking: $#{self.checking}\n Savings: $#{self.savings}\n Interest rate: %#{@interest_rate}"
    end
    def personal_info
        account_number
    end
    private
    def account_number
        10.times.map{ Random.rand(10) }.join('')
    end
end

class User < Bank_account
end   

sterling = User.new.deposit(checking: 350.5, savings: 1400.25).withdraw(checking: 80.3)
sterling.account_info