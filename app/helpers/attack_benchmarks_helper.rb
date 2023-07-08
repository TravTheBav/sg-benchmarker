module AttackBenchmarksHelper
    def existing_input(key)
        params.has_key?(key) ? params[key] : nil
    end
end
